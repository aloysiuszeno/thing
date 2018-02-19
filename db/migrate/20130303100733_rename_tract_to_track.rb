class RenameTractToTrack < ActiveRecord::Migration[5.1]
  def change
    rename_column :instructables, :tract, :track
    rename_column :users, :coordinator_tract, :coordinator_track
  end
end
