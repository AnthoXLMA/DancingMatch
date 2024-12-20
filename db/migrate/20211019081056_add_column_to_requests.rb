class AddColumnToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :profile, null: false, foreign_key: true
  end
end
