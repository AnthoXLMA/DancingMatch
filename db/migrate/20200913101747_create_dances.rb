class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :style
      t.string :location

      t.timestamps
    end
  end
end
