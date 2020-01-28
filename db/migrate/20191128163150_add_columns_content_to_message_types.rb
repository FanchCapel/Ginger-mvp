class AddColumnsContentToMessageTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :message_types, :content, :text
  end
end
