class AddForeignKeyToUser < ActiveRecord::Migration[6.0]
  def change
    # add_reference :users, :dance, null: false, foreign_key: true
  end
end
