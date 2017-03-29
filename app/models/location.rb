class Location < ApplicationRecord
  has_many :schedule_locations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
