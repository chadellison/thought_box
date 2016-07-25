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
    visit root_path
    expect(page).to have_content "Angry Cat"
    expect(Link.last.read).to eq false
  end
end

# As an authenticated user viewing the main page (links#index), I should see a simple form to submit a link.
#
# The Link model should include:
#
# A valid URL location for the link
# A title for the link
# Additionally, all links have a read status that is either true or false.
# This column will default to false.
#
# Submitting an invalid link should result in an error message being displayed.
#
# Hint: Use Ruby's built in URI.parse method to determine if a
# link is a valid URL or not. This StackOverflow post has more information.
# Alternatively, you could use a gem like this one.
#
# Once a link has been submitted, loading the index page should display all of my links.
