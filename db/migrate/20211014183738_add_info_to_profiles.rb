class AddInfoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :investissement, :string
    add_column :profiles, :niveau, :string
  end
end
