require 'test_helper'

class UserTest < Minitest::Unit::TestCase

  def setup
    DatabaseCleaner.start
    @user = User.new(email: 'user_test@gmail.com', password: 'password', password_confirmation: 'password')
  end

  def teardown
    @user = nil
    DatabaseCleaner.clean
  end
 
  def test_invalid_user
    @user.email = nil
    refute @user.valid?
  end    

  def test_valid_user
    assert @user.valid?
  end

  def test_create_user
    @user.save
    assert @user.id
  end
end
