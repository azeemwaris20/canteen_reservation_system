class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :meal, foreign_key: true
      t.references :user, foreign_key: true
      t.string :timeslot

      t.timestamps
    end
  end
end
