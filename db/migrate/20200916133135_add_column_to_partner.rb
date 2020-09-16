class AddColumnToPartner < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :dance, :string
  end
end
