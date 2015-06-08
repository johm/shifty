class CreateWeekNotes < ActiveRecord::Migration
  def change
    create_table :week_notes do |t|
      t.text :note
      t.date :monday
      t.text :author

      t.timestamps null: false
    end
  end
end
