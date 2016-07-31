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

  scenario "email must be unique" do
    User.create(username: "jones", email: "jones@gmail.com", password: "123")
    visit root_path

    click_on "Sign Up"
    within ".sign-up" do
      fill_in "Username", with: "frank"
      fill_in "Password", with: "123"
      fill_in "Password confirmation", with: "123"
      fill_in "Email", with: "jones@gmail.com"
      click_on "Create Account"
    end
    expect(page).to have_content "Invalid Entry"

    expect(current_path).to eq authentication_path
  end

  scenario "username must be unique" do
    User.create(username: "jones", email: "jones@gmail.com", password: "123")
    visit root_path

    click_on "Sign Up"
    within ".sign-up" do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      fill_in "Password confirmation", with: "123"
      fill_in "Email", with: "frank@gmail.com"
      click_on "Create Account"
    end
    expect(page).to have_content "Invalid Entry"

    expect(current_path).to eq authentication_path
  end
end
