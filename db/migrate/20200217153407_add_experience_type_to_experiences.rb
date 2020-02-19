class AddExperienceTypeToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :experience_type, :integer
  end
end
