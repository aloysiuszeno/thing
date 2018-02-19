class AddProofreaderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :proofreader, :boolean, default: false
    add_column :instructables, :proofread, :boolean, default: false
  end
end
