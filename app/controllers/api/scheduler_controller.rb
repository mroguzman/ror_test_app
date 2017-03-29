class Api::SchedulerController < ActionController::Base
  protect_from_forgery with: :null_session

  def is_open_or_close_to_location
    schedule_location = ScheduleLocation.where(
      location_id: params['location_id'],
      day_of_week: params['day_of_week']
    ).first

    if schedule_location
      time = Time.parse(params['time'])
      msg = schedule_location.is_open?(time) ? "The location is open" : "The location is close"

      render json: { messages: msg }, status: :ok
    else
      render json: { messages: "No data for that location" }, status: :no_content
    end
  end
end
