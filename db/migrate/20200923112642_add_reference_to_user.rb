class AddReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :dance, foreign_key: true
  end
end
