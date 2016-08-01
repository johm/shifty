require 'securerandom'

class AddSecretToWorker < ActiveRecord::Migration
  def change
    add_column :workers,:secretslug,:string
    unless reverting?
      Worker.all.each do |w| 
        w.secretslug=SecureRandom.hex
        w.save!
      end
    end
  end
end
