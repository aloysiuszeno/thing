class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :instructables, array: true, default: '{}'
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
