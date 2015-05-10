class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :firstname
      t.string :lastname
      t.string :mobile
      t.string :email
      t.string :foreground
      t.string :background

      t.timestamps null: false
    end
  end
end
