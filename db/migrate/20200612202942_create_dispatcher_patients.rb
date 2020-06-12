class CreateDispatcherPatients < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatcher_patients do |t|
      t.integer :dispatcher_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
