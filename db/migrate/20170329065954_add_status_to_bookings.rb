class AddStatusToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :status, :string, null: false
  end
end
