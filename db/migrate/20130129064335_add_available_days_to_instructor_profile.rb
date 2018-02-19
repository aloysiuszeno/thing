class AddAvailableDaysToInstructorProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :instructor_profiles, :available_days, :date, array: true
  end
end
