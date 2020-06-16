class AddCompletedToAppt < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :completed, :boolean, default: false
  end
end
