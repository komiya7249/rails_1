class AddCheckboxToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :checkbox, :boolean
  end
end
