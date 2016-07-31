require 'rails_helper'

RSpec.describe Link, type: :model do
  it "must have a valid url" do
    expect(Link.create(title: "invalid link", url: "google.come")).not_to be_valid
    expect(Link.create(title: "link", url: "http://google.com")).to be_valid
  end
end
