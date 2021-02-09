class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.boolean :confirmed
      t.references :user, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
