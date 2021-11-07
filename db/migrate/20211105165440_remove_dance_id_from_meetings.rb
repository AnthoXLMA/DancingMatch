class RemoveDanceIdFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :meetings, :dance, null: false, foreign_key: true
  end
end
