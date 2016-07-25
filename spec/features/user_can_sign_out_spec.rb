require "rails_helper"

RSpec.feature "user sign out" do
  scenario "user is redirected to the authorization page" do
    User.create(username: "bob", password: "123", email: "b@gmail")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "bob"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end

    click_on "Sign Out"
    expect(current_path).to eq authentication_path
  end
end
