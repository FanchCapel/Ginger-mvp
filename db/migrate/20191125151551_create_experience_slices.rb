class CreateExperienceSlices < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_slices do |t|
      t.references :activity, foreign_key: true
      t.references :experience, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
