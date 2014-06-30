require 'test_helper'

describe "Login integration" do

  before(:each) do
    DatabaseCleaner.start
  end
  after(:each) do
    DatabaseCleaner.clean
    Warden.test_reset!
  end

  it "access to sign in page" do
    visit root_path 
    page.text.must_include "Sign in"
  end

  it "log in successful - integration" do
    @user = create :user, email: "test_user@gmail.com"

    visit root_path
    fill_in "Email", with: "test_user@gmail.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    page.text.must_include "Home"
  end
end
