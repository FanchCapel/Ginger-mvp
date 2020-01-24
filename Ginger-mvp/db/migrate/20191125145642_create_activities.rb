class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :duration
      t.string :city
      t.string :meeting_point
      t.text :description
      t.monetize :price

      t.timestamps
    end
  end
end
