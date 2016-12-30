class AddAlertToShift < ActiveRecord::Migration
  def change
    add_column :shifts,:alert,:string
  end
end
