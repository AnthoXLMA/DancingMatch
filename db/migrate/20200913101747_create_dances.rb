class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :style
      t.string :location
      t.references :style
      t.timestamps
    end
  end
end
