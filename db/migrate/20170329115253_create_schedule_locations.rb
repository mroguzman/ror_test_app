class CreateScheduleLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_locations do |t|
      t.references :location, index: true, null: false
      t.time :open, null: false
      t.time :close, null: false
      t.string :day_of_week, null: false

      t.timestamps
    end
    add_index :schedule_locations, [:location_id, :day_of_week], unique: true
  end
end
