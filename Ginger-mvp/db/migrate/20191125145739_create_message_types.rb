class CreateMessageTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :message_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
