class CreateDispatcherNurses < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatcher_nurses do |t|
      t.integer :dispatcher_id
      t.integer :nurse_id

      t.timestamps
    end
  end
end
