class AddColumnsInstructionToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :instruction, :text
  end
end
