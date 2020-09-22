class AddReferencesToDances < ActiveRecord::Migration[6.0]
  def change
    add_reference :dances, :user, foreign_key: true
  end
end
