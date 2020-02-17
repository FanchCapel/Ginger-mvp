class AddBothExperiencesSelectedToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :both_experiences_selected, :boolean, default: false
  end
end
