class AddOriginalAndCommittedToChangelog < ActiveRecord::Migration[5.1]
  def change
    add_column :changelogs, :original, :text
    add_column :changelogs, :committed, :text
  end
end
