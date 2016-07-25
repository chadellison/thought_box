require "rails_helper"

RSpec.feature "user can create an account" do
  scenario "user is redirected to the links page" do
    visit root_path

    click_on "Sign Up"
    within ".sign-up" do
      fill_in "Username", with: "Jones"
      fill_in "Password", with: "123"
      fill_in "Password confirmation", with: "123"
      fill_in "Email", with: "jones@gmail.com"
      click_on "Create Account"
    end

    expect(current_path).to eq root_path
  end
end
