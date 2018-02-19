class RemoveInstructorRequested < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :instructor_requested
  end
end
