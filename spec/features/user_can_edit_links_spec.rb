require "rails_helper"

RSpec.feature "user can edit links" do
  scenario "user sees edited link" do
    User.create(username: "jones", password: "123", email: "j@gmail")
    Link.create(title: "cat", url: "http://www.popsugar.com/tech/Funny-Cat-GIFs-35436224#photo-35436224")

    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end

    click_on "Edit"
    within(".edit-form") do
      fill_in "Title", with: "Grumpy Cat"
      fill_in "Url", with: "https://www.google.com/imgres?imgurl=https://pbs.twimg.com/profile_images/616542814319415296/McCTpH_E.jpg&imgrefurl=https://twitter.com/realgrumpycat&h=400&w=400&tbnid=3D3jqT_X3WDcIM:&tbnh=186&tbnw=186&docid=Dp3XqYNL4MO7vM&itg=1&usg=__KW__BD-pQKh4wJBTi5LzGA-xbk8="
      click_on "Submit"
    end
    expect(page).to have_content "Grumpy Cat"
  end

  scenario "edited links must be valid" do
    User.create(username: "jones", password: "123", email: "j@gmail")
    Link.create(title: "cat", url: "https://www.google.com/imgres?imgurl=https://pbs.twimg.com/profile_images/616542814319415296/McCTpH_E.jpg&imgrefurl=https://twitter.com/realgrumpycat&h=400&w=400&tbnid=3D3jqT_X3WDcIM:&tbnh=186&tbnw=186&docid=Dp3XqYNL4MO7vM&itg=1&usg=__KW__BD-pQKh4wJBTi5LzGA-xbk8=")
    visit root_path

    click_on "Log In"
    within ".log-in" do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Sign In"
    end
    url = "blahblouse"
    click_on "Edit"
    within ".edit-form" do
      fill_in "Url", with: url
      click_on "Submit"
    end
    expect(page).to have_content "The Url must be valid"
    expect(page).not_to have_content "invalid link"
    expect(page).to have_content "cat"
  end
end
