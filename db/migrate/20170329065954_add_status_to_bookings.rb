class AddStatusToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :status, :string
  end
end
