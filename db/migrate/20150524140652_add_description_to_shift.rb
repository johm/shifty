class AddDescriptionToShift < ActiveRecord::Migration
  def change
    add_column :shifts,:description,:text
  end
end
