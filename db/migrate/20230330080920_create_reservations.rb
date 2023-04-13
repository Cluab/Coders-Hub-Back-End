class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
