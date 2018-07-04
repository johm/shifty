class AddActiveToWorkgroup < ActiveRecord::Migration
  def change
    add_column :workgroups, :active, :boolean
  end
end
