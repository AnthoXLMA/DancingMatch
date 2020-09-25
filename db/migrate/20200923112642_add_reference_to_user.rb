class AddReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :user, :dances, foreign_key: true
  end
end
