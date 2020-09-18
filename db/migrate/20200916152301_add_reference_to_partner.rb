class AddReferenceToPartner < ActiveRecord::Migration[6.0]
  def change
    add_reference :partners, :dance, null: true, foreign_key: true
  end
end
