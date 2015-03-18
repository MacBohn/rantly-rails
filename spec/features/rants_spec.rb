require 'rails_helper'
require 'capybara/rails'

feature 'Rants' do

  scenario "Users can create a rant" do
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within("#new_user") do
      click_on "Sign Up"
    end
      visit root_path
      click_on "New Rant"
      fill_in "Title", with: "This is the title"
      fill_in "Body", with: ("This is the body" * 10)
      click_on "Save"
      expect(page).to have_content("This is the title")
      expect(page).to have_content("This is the body")
  end

  scenario "Users can edit a rant" do
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within("#new_user") do
      click_on "Sign Up"
    end
      visit root_path
      click_on "New Rant"
      fill_in "Title", with: "This is the title"
      fill_in "Body", with: ("This is the body" * 10)
      click_on "Save"
      expect(page).to have_content("This is the title")
      expect(page).to have_content("This is the body")
      click_on "Edit"
      fill_in "Title", with: "This is the title that was edited"
      fill_in "Body", with: ("This is the body that was edited" * 9)
      click_on "Save"
      expect(page).to have_content("This is the title that was edited")
      expect(page).to have_content("This is the body that was edited")
  end

  scenario "Users can delete a rant" do
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within("#new_user") do
      click_on "Sign Up"
    end
      visit root_path
      click_on "New Rant"
      fill_in "Title", with: "This is the title"
      fill_in "Body", with: ("This is the body" * 10)
      click_on "Save"
      expect(page).to have_content("This is the title")
      expect(page).to have_content("This is the body")
      click_on "Edit"
      click_on "Delete"
      expect(page).to_not have_content("This is the title")
      expect(page).to_not have_content("This is the body")
    end

    scenario "Users have to type in at least 144 characters in body of rant" do
      visit '/sign-up'
      fill_in "First name", with: "Mac"
      fill_in "Last name", with: "Bohn"
      fill_in "Email", with: "Mac@Bohn.com"
      fill_in "Password", with: "password"
      within("#new_user") do
        click_on "Sign Up"
      end
        visit root_path
        click_on "New Rant"
        fill_in "Title", with: "This is the title"
        fill_in "Body", with: "This is the body"
        click_on "Save"
        expect(page).to have_content("Body is too short (minimum is 144 characters)")
    end

    scenario "Users can't edit a rant" do
      visit '/sign-up'
      fill_in "First name", with: "Mac"
      fill_in "Last name", with: "Bohn"
      fill_in "Email", with: "Mac@Bohn.com"
      fill_in "Password", with: "password"
      within("#new_user") do
        click_on "Sign Up"
      end

      click_on "New Rant"
      fill_in "Title", with: "This is the title"
      fill_in "Body", with: ("This is the body" * 10)
      click_on "Save"
      expect(page).to have_content("This is the title")
      expect(page).to have_content("This is the body")
        visit root_path

        click_on "Sign Out"

        visit '/sign-up'
        fill_in "First name", with: "John"
        fill_in "Last name", with: "Jones"
        fill_in "Email", with: "John@Jones.com"
        fill_in "Password", with: "password"
        within("#new_user") do
          click_on "Sign Up"
        end
        visit root_path
        expect(page).to_not have_content("Edit")

      end

end
