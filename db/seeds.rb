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
]

dance_names.each do |dance_name|
  dance_request = RestClient.get("https://source.unsplash.com/1200x700/?garden")
  dance = Dance.new(
      style: dance_name,
    )
  dance.save!
  3.times do
    partner_request = RestClient.get("https://source.unsplash.com/400x300/?flower")
    partner = Partner.new(
      name: Faker::FunnyName.name,
    )
    partner.dance = dance
    partner.save!
    sleep(2)
  end
end
