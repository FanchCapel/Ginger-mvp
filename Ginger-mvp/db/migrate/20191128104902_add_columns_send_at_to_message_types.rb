class AddColumnsSendAtToMessageTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :message_types, :send_at, :datetime
  end
end
