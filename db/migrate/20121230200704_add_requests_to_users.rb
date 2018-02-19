class AddRequestsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :instructor_requested, :boolean
  end
end
