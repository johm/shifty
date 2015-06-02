class AddNotesToWorker < ActiveRecord::Migration
  def change
    add_column :workers,:notes,:text
  end
end
