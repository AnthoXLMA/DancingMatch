class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :title
      t.references :user
      t.timestamps
    end
  end
end
