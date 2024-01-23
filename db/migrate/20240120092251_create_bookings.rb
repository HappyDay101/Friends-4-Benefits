class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end

    add_index :bookings, :start_date
    add_index :bookings, :end_date

    add_check_constraint :bookings, 'start_date < end_date', name: 'start_date_before_end_date'
  end
end
