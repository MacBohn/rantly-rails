require 'rails_helper'
require 'capybara/rails'

feature 'Rants' do
  scenario "Users can click on new rants button" do
  visit root_path
  click_on "New Rant"
  expect(page).to have_content('New Rants')
end


end
