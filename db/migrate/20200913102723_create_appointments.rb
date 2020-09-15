class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
    t.references :user, foreign_key: true
    # t.references :partner, foreign_key: true
    t.date :date
    t.string :location

    t.timestamps
  end
  end
end
