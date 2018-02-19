class RemoveInstructorFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :instructor
  end
end
