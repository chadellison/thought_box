require "rails_helper"

RSpec.feature "user must sign in" do
  scenario "user is prompted to sign up or sign in" do
    visit root_path

    expect(page).to have_content "Please Log In or Sign Up"
  end
end
