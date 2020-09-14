class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
    t.belongs_to :partners
    t.belongs_to :users
    t.date :date
    t.string :location

    t.timestamps
  end
  end
end
