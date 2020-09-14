# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning DB"
Dance.destroy_all

dance_names = [
  "Salsa",
  "Tango",
  "Rock",
  "West Coast Swing",
]
dance_names.each do |dance_name|
  dances = Dance.new(
      style: dance_name,
    )
  dances.save!
end
