class AddNewForeignKeyToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :dance, foreign_key: true
  end
end
