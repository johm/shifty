class CreatePayRates < ActiveRecord::Migration
  def change
    create_table :pay_rates do |t|
      t.references :worker, index: true, foreign_key: true
      t.date :effective
      t.integer :hourly_pay_in_cents
      t.integer :hourly_capital_contribution_in_cents
      t.integer :hourly_predicted_extra_wage_in_cents
      t.text :notes

      t.timestamps null: false
    end
  end
end
