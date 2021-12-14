class AddColumnsToMeetings < ActiveRecord::Migration[6.0]
  def change
    # add_reference :meetings, :user, null: false, foreign_key: true
    # add_reference :meetings, :profile, null: false, foreign_key: true
    add_column :meetings, :date, :datetime
  end
end
