class AddPreferenceLevelToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :preference_level, :integer
  end
end
