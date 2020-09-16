# puts "cleaning DB..."
# Dance.delete_all
# Partner.delete_all
# User.delete_all

puts "CREATE PARTNERS..."
elodie = Partner.new(
    name: "Elodie",
    gender: "lady",
    age: "42",
    location: "Nantes",
    email: "elo.die@example.com",
    password: "secret",
    experience: "2",
    contact: "0600112233",
    dance: "salsa"
)
elodie.save!

adel = Partner.new(
    name: "Adel",
    gender: "Gentlemen",
    age: "29",
    location: "Paris",
    email: "Adel@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000007",
    dance: "Merengue"

)
adel.save!

flavien = Partner.new(
    name: "Flavien",
    gender: "Gentlemen",
    age: "24",
    location: "Lyon",
    email: "flavien@example.com",
    password: "secret",
    experience: "intermediaire",
    contact: "0600000001",
    dance: "Kizomba"
)
flavien.save!

jerry = Partner.new(
    name: "Jerry",
    gender: "Gentlemen",
    age: "38",
    location: "Paris",
    email: "jerry@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000002",
    dance: "Salsa Portoricaine"
)
jerry.save!

amanda = Partner.new(
    name: "Amanda",
    gender: "lady",
    age: "34",
    location: "Paris",
    email: "amanda@example.com",
    password: "secret",
    experience: "pro",
    contact: "0600000003",
    dance: "Salsa Cubana"
)
amanda.save!

puts "CREATE DANCES..."
salsa = Dance.new(
  name: "Salsa"
  )
salsa.save!

bachata = Dance.new(
  name: "Bachata",
  )
bachata.save!

merengue = Dance.new(
  name: "Merengue",
  )
merengue.save!

kizomba = Dance.new(
  name: "Kizomba",
  )
kizomba.save!

rock = Dance.new(
  name: "Rock",
  )
rock.save!

wcs = Dance.new(
  name: "West Coast Swing",
  )
wcs.save!

zumba = Dance.new(
  name: "Zumba",
  )
zumba.save!

tango = Dance.new(
  name: "Tango",
  )
tango.save!

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
