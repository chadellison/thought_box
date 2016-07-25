require "rails_helper"

RSpec.feature "user can create an account" do
  scenario "user is redirected to the links page" do
    visit root_path

    click_on "Sign Up"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "123"
    fill_in "Email", with: "jones@gmail.com"
    fill_in "Password_confirmation", with: "123"
    click_on "Create Account"

    expect(current_path).to eq root_path
  end
end

# If I click "Sign Up", I should be taken to a user form where
# I can enter an email address, a password, and a password confirmation.
#
# I cannot sign up with an email address that has already been used.
# Password and confirmation must match.
# Upon submitting this information,
# I should be logged in via a cookie and redirected to the "Links Index" page.
