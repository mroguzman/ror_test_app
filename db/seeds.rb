# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location = Location.new(id: 1, name: "Madrid")
location.save!

schedule = ScheduleLocation.new(location_id: location.id, open: "13:11", close: "17:00", day_of_week: "Monday")
schedule.save!
