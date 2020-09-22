class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :pseudo
      t.string :gender
      t.integer :age
      t.string :location
      t.integer :experience
      t.string :contact
      t.references :dances
      t.timestamps
    end
  end
end
