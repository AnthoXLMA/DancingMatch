class AddColumnToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :user, null: false, foreign_key: true
    add_reference :profiles, :dance, null: false, foreign_key: true
  end
end
