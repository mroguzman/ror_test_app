require 'test_helper'

class ScheduleLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @location = Location.new(name: "Barcelona")
    @location.save!

    @schedule_location = ScheduleLocation.new(open: '2017-03-27 10:00:00',
      close: '2017-03-27 21:00:00', location_id: @location.id, day_of_week: "Monday")
  end

  test "should be valid" do
    assert @schedule_location.valid?
  end

  test "open should be present" do
    @schedule_location.open = nil

    assert_not @schedule_location.valid?
  end

  test "close should be present" do
    @schedule_location.close = nil

    assert_not @schedule_location.valid?
  end

  test "day_of_week should be present" do
    @schedule_location.day_of_week = nil

    assert_not @schedule_location.valid?
  end

  test "day_of_week should not be repeated for a location" do
    @schedule_location.save!

    schedule_location_two = ScheduleLocation.new(open: '2017-03-27 13:00:00',
      close: '2017-03-27 19:00:00', location_id: @location.id, day_of_week: "Monday")

    assert_not schedule_location_two.valid?
  end

  test "day_of_week should be valid" do
    schedule_location_with_invalid_day = ScheduleLocation.new(open: '2017-03-27 13:00:00',
      close: '2017-03-27 19:00:00', location_id: @location.id, day_of_week: "Invalid day")

      assert_not schedule_location_with_invalid_day.valid?
      assert schedule_location_with_invalid_day.errors.include?(:day_of_week)
  end

  test "is_open? receiving a hour out of range returns false" do
    time = Time.parse('19:01')

    schedule_location_time = ScheduleLocation.new(open: '2017-03-27 13:00:00',
      close: '2017-03-27 19:00:00', location_id: @location.id, day_of_week: "Monday")

    assert_not schedule_location_time.is_open?(time)
  end

  test "is_open? receiving a hour inside range returns true" do
    time = Time.parse('13:00')

    schedule_location_time = ScheduleLocation.new(open: '2017-03-27 13:00:00',
      close: '2017-03-27 19:00:00', location_id: @location.id, day_of_week: "Monday")

    assert schedule_location_time.is_open?(time)
  end
end
