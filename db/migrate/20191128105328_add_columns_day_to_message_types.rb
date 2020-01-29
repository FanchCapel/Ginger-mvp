class AddColumnsDayToMessageTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :message_types, :day, :integer
  end
end
