class CreateShiftTemplates < ActiveRecord::Migration
  def change
    create_table :shift_templates do |t|
      t.string :name
      t.text :notes

      t.timestamps null: false
    end
  end
end
