class RenameLocationToAddressInAppointmentsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :location, :address
  end
end
