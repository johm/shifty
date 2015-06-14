class AddLastInitialToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :last_initial, :string
  end
end
