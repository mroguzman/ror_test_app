require 'test_helper'

class ScheduleLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = Location.new(name: "Barcelona")
    @location.save

    @schedule_location = ScheduleLocation.new(open: '2017-03-27 10:00:00',
      close: '2017-03-27 21:00:00', location_id: @location.id, day_of_week: "Monday")
    @schedule_location.save
  end

  test "should get index" do
    get location_schedule_locations_url(@location)
    assert_response :success
  end

  test "should get new" do
    get new_location_schedule_location_url(@location)
    assert_response :success
  end

  test "should show schedule_location" do
    get location_schedule_location_url(@location, @schedule_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_schedule_location_url(@location, @schedule_location)
    assert_response :success
  end

  test "should destroy schedule_location" do
    assert_difference('ScheduleLocation.count', -1) do
      delete location_schedule_location_url(@location,@schedule_location)
    end

    assert_redirected_to location_schedule_locations_url(@location)
  end
end
