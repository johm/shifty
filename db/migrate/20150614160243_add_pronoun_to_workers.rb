class AddPronounToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :pronoun, :string
  end
end
