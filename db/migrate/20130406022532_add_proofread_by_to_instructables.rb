class AddProofreadByToInstructables < ActiveRecord::Migration[5.1]
  def change
    add_column :instructables, :proofread_by, :integer, array: true, default: '{}'
  end
end
