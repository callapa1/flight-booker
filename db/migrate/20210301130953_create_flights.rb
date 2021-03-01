class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :code
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
    add_index :flights, :code, unique: true
    add_index :flights, :date
    add_index :flights, :from_airport_id
    add_index :flights, :to_airport_id
  end
end
