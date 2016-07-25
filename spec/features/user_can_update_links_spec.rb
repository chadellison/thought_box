require "rails_helper"

RSpec.feature "user can update links" do
  scenario "user sees link change" do
    User.create(username: "bob", password: "123", email: "b@gmail")
    Link.create(title: "google", url: "google.com")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "bob"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end

    expect(Link.last.read).to equal false
    click_on "Mark as Read"
    expect(Link.last.read).to equal true
  end

  scenario "user sees link change back to unread" do
    User.create(username: "bob", password: "123", email: "b@gmail")
    Link.create(title: "google", url: "google.com", read: true)

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "bob"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end

    expect(Link.last.read).to equal true
    click_on "Mark as Unread"
    expect(Link.last.read).to equal false
  end
end
