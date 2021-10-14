class AddPhotoToDances < ActiveRecord::Migration[6.0]
  def change
    add_column :dances, :photo, :string
  end
end
