class CreateMilestoneAccomplishments < ActiveRecord::Migration
  def change
    create_table :milestone_accomplishments do |t|
      t.references :milestone, index: true, foreign_key: true
      t.references :worker, index: true, foreign_key: true
      t.date :date
      t.text :notes

      t.timestamps null: false
    end
  end
end
