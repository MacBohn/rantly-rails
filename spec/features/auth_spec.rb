require 'rails_helper'
require 'capybara/rails'

feature "Users" do
  scenario "Users can sign up" do
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within("#new_user") do
      click_on "Sign Up"
      end
      expect(page).to have_content("Mac")
      end

      scenario "Users can signout" do
        visit '/sign-up'
        fill_in "First name", with: "Mac"
        fill_in "Last name", with: "Bohn"
        fill_in "Email", with: "Mac@Bohn.com"
        fill_in "Password", with: "password"
        within("#new_user") do
          click_on "Sign Up"
          end
          expect(page).to have_content("Mac")
          click_on "Log Out"
          expect(page).to_not have_content("Mac")
          end

          scenario "Users can sign in and Log Out" do
            visit '/sign-up'
            fill_in "First name", with: "Mac"
            fill_in "Last name", with: "Bohn"
            fill_in "Email", with: "Mac@Bohn.com"
            fill_in "Password", with: "password"
            within("#new_user") do
              click_on "Sign Up"
              end
              expect(page).to have_content("Mac")
              click_on "Log Out"
              expect(page).to_not have_content("Mac")
              visit root_path
              fill_in "Your email", with: "Mac@Bohn.com"
              fill_in "Your password", with: "password"
              click_on "Log In"
              expect(page).to have_content("Mac")
              end
            end
