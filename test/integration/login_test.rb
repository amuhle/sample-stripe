require 'test_helper'

describe "Login integration" do
  it "access to sign in page" do
    visit root_path 
    page.text.must_include "Sign in"
  end

  it "log in successful" do
    Capybara.current_driver = :selenium

    create(:user) 

    visit root_path

    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    page.text.must_include "Home"
  end
end
