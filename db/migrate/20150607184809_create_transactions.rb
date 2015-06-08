class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount_in_cents
      t.date :date_made
      t.references :worker, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
