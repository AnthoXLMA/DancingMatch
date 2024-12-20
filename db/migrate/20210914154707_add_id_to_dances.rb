class AddIdToDances < ActiveRecord::Migration[6.0]
  def change
    add_reference :dances, :user, null: true, foreign_key: true
  end
end
