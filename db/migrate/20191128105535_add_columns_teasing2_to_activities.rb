class AddColumnsTeasing2ToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :teasing2, :text
  end
end
