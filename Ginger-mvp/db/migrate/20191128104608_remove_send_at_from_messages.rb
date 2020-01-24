class RemoveSendAtFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :send_at, :datetime
  end
end
