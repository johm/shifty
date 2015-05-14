class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :worker, index: true, foreign_key: true
      t.integer :day_of_week
      t.date :monday
      t.string :start_time
      t.string :end_time
      t.references :task, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
