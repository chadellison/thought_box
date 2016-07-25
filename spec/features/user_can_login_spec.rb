require "rails_helper"

RSpec.feature "user can login" do
  scenario "user is redirected to the links page" do
    User.create(username: "bob", password: "123", email: "b@gmail")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "bob"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end

    expect(current_path).to eq root_path
  end
end
