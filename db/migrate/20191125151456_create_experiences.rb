class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true
      t.monetize :budget
      t.string :city
      t.date :date
      t.string :time_slot
      t.timestamp :paid_at
      t.timestamp :prepared_at

      t.timestamps
    end
  end
end
