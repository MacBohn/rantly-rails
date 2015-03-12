require 'rails_helper'
require 'capybara/rails'

feature "Users" do
  scenario "Users can sign up" do
    visit '/sign-up'
    save_and_open_page
  end



end
