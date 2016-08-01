class AddWorkerToUser < ActiveRecord::Migration
  def change
    add_reference :users, :worker, :index=>true
  end
end
