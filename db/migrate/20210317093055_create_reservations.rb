class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.integer :admin_id
      t.datetime :dated_on
      t.string :name
      t.string :title
      t.string :staff
      t.string :detail
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
