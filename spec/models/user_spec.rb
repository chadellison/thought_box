require 'rails_helper'

RSpec.describe User, type: :model do
  it "should validate the presence and uniqueness of username and email" do
    expect(User.create(email: "a@gmail.com", password: "123")).not_to be_valid
    expect(User.create(username: "bob", password: "123")).not_to be_valid
    expect(User.create(email: "a@gmail.com", username: "frank")).not_to be_valid

    expect(User.create(email: "a@gmail.com", username: "frank", password: "123")).to be_valid
    User.create(username: "jones", password: "123", email: "abc")
    expect(User.create(username: "Martha", password: "123", email: "abc")).not_to be_valid
  end

  it "should have many links" do
    user = User.create(username: "frank", password: "123", email: "j@gmail.com")
    link = Link.create(title: "hearts", url: "https://www.google.com/?gws_rd=ssl")
    user.links << link
    expect(user.links).to eq [link]
  end
end
