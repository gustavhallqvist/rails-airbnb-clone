class RemoveDatesFromBookings < ActiveRecord::Migration[6.0]
  def change

    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
  end
end