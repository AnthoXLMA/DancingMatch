class CreateDances < ActiveRecord::Migration[6.0]
  def change
    create_table :dances do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :partner, foreign_key: true
      t.timestamps
    end
  end
end
