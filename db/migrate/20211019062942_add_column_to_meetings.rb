class AddColumnToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :location, :string
  end
end
