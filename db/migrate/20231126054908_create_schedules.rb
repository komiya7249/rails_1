class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :startday
      t.date :endday
      t.string :allday
      t.string :text

      t.timestamps
    end
  end
end
