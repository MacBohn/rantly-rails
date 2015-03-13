require 'rails_helper'
require 'capybara/rails'

feature "Users" do
  scenario "Users can sign up" do
    visit '/sign-up'
    fill_in "First name", with: "Mac"
    fill_in "Last name", with: "Bohn"
    fill_in "Email", with: "Mac@Bohn.com"
    fill_in "Password", with: "password"
    within(".new_user") do
      click_on "Sign Up"
    end
  end



end
