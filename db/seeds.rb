# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning DB..."
Dance.destroy_all
User.destroy_all
Partner.destroy_all
Appointment.destroy_all

puts "Create users..."
anthony = User.new(
    gender: "Male",
    name: "Anthony",
    age: "37",
    location: "Paris",
    email: "antho.mani@example.com",
    password: "secret",
    experience: "novice",
    contact: "0635158132",
)
anthony.save!

puts "Create dances..."
dance_names = [
  "Salsa",
  "Tango",
  "Rock",
  "West Coast Swing",
  "Samba",
  "Zumba",
  "BreakDance",
  "Modern Jazz",
]
dance_names.each do |dance_name|
  dances = Dance.new(
      style: dance_name,
    )
  dances.save!
end

puts "Create partners..."
elodie = Partner.new(
    gender: "Female",
    name: "Elodie",
    age: "42",
    location: "Nantes",
    email: "elo.die@example.com",
    password: "secret",
    experience: "intermediaire",
    contact: "0600112233",
    dances: "BreakDance"
)
elodie.save!

adel = Partner.new(
    gender: "Male",
    name: "Adel",
    age: "29",
    location: "Paris",
    email: "Adel@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000007",
    dances: "Salsa"
)
adel.save!

flavien = Partner.new(
    gender: "male",
    name: "flavien",
    age: "24",
    location: "Lyon",
    email: "flavien@example.com",
    password: "secret",
    experience: "intermediaire",
    contact: "0600000001",
    dances: "Kizomba"
)
flavien.save!

jerry = Partner.new(
    gender: "Male",
    name: "jerry",
    age: "38",
    location: "Paris",
    email: "jerry@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000002",
    dances: "Salsa Portoricaine"
)
jerry.save!

amanda = Partner.new(
    gender: "Female",
    name: "Amanda",
    age: "34",
    location: "Paris",
    email: "amanda@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000003",
    dances: "merengue"
)
amanda.save!

puts "Create appointments..."

  appointment_request_anthony = Appointment.create!(
    user: anthony,
    partner: amanda,
    location: "Paris",
)
appointment_request_anthony.save

  appointment_call_anthony = Appointment.create!(
    user: anthony,
    partner: flavien,
    location: "Paris",
)

appointment_call_anthony.save
puts "Done!"
