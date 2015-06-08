class AddTypeToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions,:transactiontype,:string
  end
end
