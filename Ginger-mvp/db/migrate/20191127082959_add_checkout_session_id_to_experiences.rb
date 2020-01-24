class AddCheckoutSessionIdToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :checkout_session_id, :string
  end
end
