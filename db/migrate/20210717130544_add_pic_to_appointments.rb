class AddPicToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :pic, :string
  end
end
