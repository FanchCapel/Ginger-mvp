class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.timestamp :send_at
      t.references :message_type, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
