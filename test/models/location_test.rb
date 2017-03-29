require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @location = Location.new(name: "Madrid")
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "name should be present" do
    @location.name = ""
    assert_not @location.valid?
  end

  test "name should be uniqueness" do
    duplicate_location = @location.dup
    duplicate_location.name = @location.name
    @location.save
    assert_not duplicate_location.valid?
  end
end
