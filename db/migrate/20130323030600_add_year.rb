class AddYear < ActiveRecord::Migration[5.1]
  def up
    add_column :instances, :year, :integer
    add_column :schedules, :year, :integer
    add_column :changelogs, :year, :integer

    execute('update instructables set year=2018')
    execute('update instances set year=2018')
    execute('update schedules set year=2018')
    execute('update changelogs set year=2018')
  end

  def down
    remove_column :instances, :year
    remove_column :schedules, :year
    remove_column :changelogs, :year
  end
end
