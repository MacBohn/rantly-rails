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
end


end
