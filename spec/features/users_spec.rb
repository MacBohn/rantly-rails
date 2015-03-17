require 'rails_helper'
require 'capybara/rails'

feature "Users" do
  scenario "Users can see list of all users in the users route" do
    create_user
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within("#new_user") do
      click_on "Sign Up"
      end
    visit root_path
    click_on "Users"
    expect(page).to have_content("John Jones")
    expect(page).to have_content("Mac Bohn")

end

  end
