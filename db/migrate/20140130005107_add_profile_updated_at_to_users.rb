class AddProfileUpdatedAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_updated_at, :timestamp
  end
end
