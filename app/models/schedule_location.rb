class ScheduleLocation < ApplicationRecord

  DAYS_OF_WEEK = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  belongs_to :location

  validates :open, presence: true
  validates :close, presence: true
  validates :day_of_week, presence: true, uniqueness: { scope: :location_id }, inclusion: { in: DAYS_OF_WEEK }

  def is_open?(time)
    modified_time = Time.utc(open.year, open.month, open.day, time.hour, time.min, time.sec)
    modified_time.between?(open, close)
  end
end
