class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :location
      t.datetime :start_time
      t.integer :length
      t.integer :patient_id
      t.integer :nurse_id

      t.timestamps
    end
  end
end
