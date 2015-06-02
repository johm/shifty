class AddTemplateReferencesToShifts < ActiveRecord::Migration
  def change
    add_reference :shifts,:shift_template, index: true
    add_foreign_key :shifts,:shift_templates
  end
end
