class AddColumnToDance < ActiveRecord::Migration[6.0]
  def change
    add_reference :dances, :partner, foreign_key: true
  end
end
