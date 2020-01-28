class AddColumnsTeasing1ToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :teasing1, :text
  end
end
