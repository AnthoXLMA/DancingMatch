class AddReferenceToPartner < ActiveRecord::Migration[6.0]
  def change
    add_reference :partners, :dance, null: false, foreign_key: true
  end
end
