class CreateProfileAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_attributes do |t|
      t.references :profile, null: false, foreign_key: true
      t.integer :ambition, default: 0
      t.integer :social, default: 0
      t.integer :technique, default: 0
      t.integer :empathie, default: 0

      t.timestamps
    end
  end
end

