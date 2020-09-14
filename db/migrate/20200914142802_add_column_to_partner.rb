class AddColumnToPartner < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :email, :string
    add_column :partners, :password, :string
  end
end
