class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :review
      t.text :comment
      t.integer :pax

      t.timestamps
    end
  end
end
