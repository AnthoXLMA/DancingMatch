class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :gender
      t.string :name
      t.integer :age
      t.string :location
      t.integer :experience
      t.string :contact

      t.timestamps
    end
  end
end
