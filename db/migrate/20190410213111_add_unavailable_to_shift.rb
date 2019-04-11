class AddUnavailableToShift < ActiveRecord::Migration
  def change
    add_column :shifts, :unavailable, :boolean
  end
end
