class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.integer :booking_id

      t.timestamps
    end
    add_index :passengers, :email
  end
end
