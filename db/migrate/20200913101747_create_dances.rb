class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :style
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
