require 'test_helper'

class LoginTest < Capybara::Rails::TestCase
  self.use_transactional_fixtures = false

  def test_access_login_integration
    visit root_path 
    assert page
    assert_content "Sign in"
  end

  def test_login_successful
    Capybara.current_driver = :selenium

    create(:user) 

    visit root_path

    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    assert_content page, "Home"
  end
end
