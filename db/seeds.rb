puts "cleaning DB..."
Dance.delete_all
Partner.delete_all
# User.delete_all

puts "Create dances..."
dances = [
  "Rock",
  "Tango",
  "Merengue",
  "Salsa Cubana",
  "Salsa Portoricana",
  "Bachata",
  "Flamenco",
  "Rumba",
  "Paso Doble",
  "Milonga",
  "Lambada",
  "Valse",
  "West Coast Swing",
  "Irish Taps",
  "Country",
  "Break Dance",
  "Lindy Hop",
  "Charleston",
  "Shag",
  "Blues",
  "Boogie Woogie",
  "FoxTrot",
  "ChaCha"
]
dances.each do |dance|
  dance = Dance.new(
      name: dance
    )
  dance.save
end

puts "CREATE PARTNERS..."
elodie = Partner.new(
  name: "Elodie",
  gender: "Lady",
  age: "42",
  location: "Nantes",
  email: "elo.die@example.com",
  password: "secret",
  experience: "5",
  contact: "0600112233",
  dance: "Tango",
  # dance_id: rock.id,
)
elodie.dance = dances[1]
elodie.save

adel = Partner.new(
    name: "Adel",
    gender: "Gentleman",
    age: "29",
    location: "Paris",
    email: "Adel@example.com",
    password: "secret",
    experience: "13",
    contact: "0600000007",
    dance: "Merengue",
    # dance_id: merengue.id,
)
adel.dance = dances[6]
adel.save

flavien = Partner.new(
    name: "Flavien",
    gender: "Gentleman",
    age: "24",
    location: "Lyon",
    email: "flavien@example.com",
    password: "secret",
    experience: "4",
    contact: "0600000001",
    dance: "Kizomba",
    # dance_id: tango.id,
)
flavien.dance = dances[1]
flavien.save

jerry = Partner.new(
    name: "Jerry",
    gender: "Gentleman",
    age: "38",
    location: "Paris",
    email: "jerry@example.com",
    password: "secret",
    experience: "12",
    contact: "0600000002",
    dance: "Salsa Portoricana",
    # dance_id: tango.id,
)
jerry.dance = dances[2]
jerry.save

amanda = Partner.new(
    name: "Amanda",
    gender: "Lady",
    age: "34",
    location: "Paris",
    email: "amanda@example.com",
    password: "secret",
    experience: "8",
    contact: "0600000003",
    dance: "Salsa Cubana",
    # dance_id: rock.id,
)
amanda.dance = dances[4]
amanda.save
# puts "CREATE DANCES..."
# salsa = Dance.new(
#   name: "Salsa"
#   )
# salsa.save!

# bachata = Dance.new(
#   name: "Bachata",
#   )
# bachata.save!

# merengue = Dance.new(
#   name: "Merengue",
#   )
# merengue.save!

# kizomba = Dance.new(
#   name: "Kizomba",
#   )
# kizomba.save!

# rock = Dance.new(
#   name: "Rock",
#   )
# rock.save!

# wcs = Dance.new(
#   name: "West Coast Swing",
#   )
# wcs.save!

# zumba = Dance.new(
#   name: "Zumba",
#   )
# zumba.save!

# tango = Dance.new(
#   name: "Tango",
#   )
# tango.save!


# # users = []
# # users.appointments.each do |appointment|
# #   users << appointment.user
# # end

# puts "Create users..."
# anthony = User.new(
#     gender: "Male",
#     name: "Anthony",
#     age: "37",
#     location: "Paris",
#     email: "antho.mani@example.com",
#     password: "secret",
#     experience: "1",
#     contact: "0635158132",
#     # dance_id: "salsa.id",
#   )
# anthony.save!

# marc = User.new(
#     gender: "Male",
#     name: "Marc",
#     age: "37",
#     location: "Paris",
#     email: "antho.mani@example.com",
#     password: "secret",
#     experience: "1",
#     contact: "0635158132",
#     # dance_id: salsa.id,
#   )
# marc.save!

# edouard = User.new(
#     gender: "Male",
#     name: "Edouard",
#     age: "37",
#     location: "Paris",
#     email: "antho.mani@example.com",
#     password: "secret",
#     experience: "1",
#     contact: "0635158132",
#   )
# edouard.save!

# # anthony.partners

# # julien = User.new(
# #     gender: "Male",
# #     name: "Julien",
# #     age: "19",
# #     location: "Marseille",
# #     email: "julien.de@example.com",
# #     password: "secret",
# #     experience: "5",
# #     contact: "0600010203",
# # )
# # julien.save!

# # puts "retrieving user dance..."
# # dance = Dance.last
# # users = []
# # dance.appointments.each do |appointment|
# #   users << appointment.user
# # end

# # puts "Create appointments..."
# #   appointment_request_anthony = Appointment.create!(
# #     user: anthony,
# #     partner: flavien,
# #     location: "Nantes",
# # )
# # appointment_request_anthony.save

# #   appointment_call_anthony = Appointment.create!(
# #     user: anthony,
# #     partner: amanda,
# #     location: "Paris",
# # )

# # appointment_call_anthony.save
# # puts "Done!"
