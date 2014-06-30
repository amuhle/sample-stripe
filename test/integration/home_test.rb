require 'test_helper'

describe "Home View with products integration" do
  include Warden::Test::Helpers

  before(:each) do
    DatabaseCleaner.start
    @user = create(:user)
    login_as @user, scope: :user
  end
  after(:each) do
    Warden.test_reset!
    DatabaseCleaner.clean
  end

  it "appears at least one product" do
    create(:product, name: "TV")
    visit home_path 
    page.text.must_include "TV"
  end

  it "can click a buy link" do
    create(:product, name: "TV")
    page.all('li').count.must_equal 1
    page.all('li').first.text.must_match(/Buy/)
  end

end
