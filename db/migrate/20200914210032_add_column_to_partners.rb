class AddColumnToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :dances, :string
  end
end
