class AddTypeAndActiveToWorker < ActiveRecord::Migration
  def change
    add_column :workers,:active,:boolean
    add_column :workers,:utility,:boolean
  end
end
