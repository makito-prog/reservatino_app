class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.string :content

      t.timestamps
    end
  end
end
