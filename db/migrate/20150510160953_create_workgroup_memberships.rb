class CreateWorkgroupMemberships < ActiveRecord::Migration
  def change
    create_table :workgroup_memberships do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :workgroup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
