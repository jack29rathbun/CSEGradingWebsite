require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = Admin.new(password:"foobar")
  end

  test "should not be valid" do
    assert_not @admin.valid?
  end

  test "should be valid" do
    @admin.password = "password"
    assert @admin.valid?
  end
end
