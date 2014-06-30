require 'test_helper'

describe User do
  before(:each) do
    DatabaseCleaner.start
    @user = User.new(email: 'user_test@gmail.com', 
                     password: 'password', 
                     password_confirmation: 'password')
  end

  after(:each) do
    @user = nil
    DatabaseCleaner.clean
  end
 
  it "has to be an invalid user" do
    @user.email = nil
    @user.wont_be :valid?, true
  end

  it "has to be a valid user" do
    @user.must_be :valid?, true
  end

  it "creates a user" do
    @user.save
    @user.wont_be_nil
  end
end
