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
      fill_in "Body", with: "This is the body"
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
      fill_in "Body", with: "This is the body"
      click_on "Save"

      expect(page).to have_content("This is the title")
      expect(page).to have_content("This is the body")

      click_on "Edit"

      fill_in "Title", with: "This is the title that was edited"
      fill_in "Body", with: "This is the body that was edited"
      click_on "Save"

      expect(page).to have_content("This is the title that was edited")
      expect(page).to have_content("This is the body that was edited")






  end


  end
