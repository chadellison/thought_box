require "rails_helper"

RSpec.feature "user can add links" do
  scenario "user sees added link and all links upon page load" do
    User.create(username: "jones", password: "123", email: "j@gmail")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end
    url = "http://www.popsugar.com/tech/Funny-Cat-GIFs-35436224#photo-35436224"

    fill_in "Title", with: "Angry Cat"
    fill_in "Url", with: url
    click_on "Submit"
    expect(page).to have_content "Links"
    expect(page).to have_content "Angry Cat"
    expect(Link.last.read).to eq false
  end

  scenario "links must be valid" do
    User.create(username: "jones", password: "123", email: "j@gmail")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end
    url = "blahblouse"

    fill_in "Title", with: "invalid link"
    fill_in "Url", with: url
    click_on "Submit"

    expect(page).to have_content "The Url must be valid"
    expect(page).not_to have_content "invalid link"
  end
end
