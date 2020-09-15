puts "cleaning DB..."
Appointment.delete_all
Partner.delete_all
Dance.delete_all
User.delete_all

puts "Create dances..."
salsa = Dance.new(
  style: "salsa",
  )
salsa.save!

bachata = Dance.new(
  style: "bachata",
  )
bachata.save!

merengue = Dance.new(
  style: "merengue",
  )
merengue.save!

kizomba = Dance.new(
  style: "kizomba",
  )
kizomba.save!

rock = Dance.new(
  style: "rock",
  )
rock.save!

wcs = Dance.new(
  style: "wcs",
  )
wcs.save!

zumba = Dance.new(
  style: "zumba",
  )
zumba.save!

tango = Dance.new(
  style: "tango",
  )
tango.save!

puts "Create users..."
anthony = User.new(
    gender: "Male",
    name: "Anthony",
    age: "37",
    location: "Paris",
    email: "antho.mani@example.com",
    password: "secret",
    experience: "1",
    contact: "0635158132",
    dance_id: merengue.id,
)
anthony.save!

# julien = User.new(
#     gender: "Male",
#     name: "Julien",
#     age: "19",
#     location: "Marseille",
#     email: "julien.de@example.com",
#     password: "secret",
#     experience: "5",
#     contact: "0600010203",
# )
# julien.save!

# puts "Create partners..."
# elodie = Partner.new(
#     gender: "Female",
#     name: "Elodie",
#     age: "42",
#     location: "Nantes",
#     email: "elo.die@example.com",
#     password: "secret",
#     experience: "2",
#     contact: "0600112233",
#     dance_id: merengue.id,
# )
# elodie.save!

# adel = Partner.new(
#     gender: "Male",
#     name: "Adel",
#     age: "29",
#     location: "Paris",
#     email: "Adel@example.com",
#     password: "secret",
#     experience: "pro",
#     contact: "0600000007",
#     dance_id: salsa.id,

# )
# adel.save!

# flavien = Partner.new(
#     gender: "male",
#     name: "Flavien",
#     age: "24",
#     location: "Lyon",
#     email: "flavien@example.com",
#     password: "secret",
#     experience: "intermediaire",
#     contact: "0600000001",
#     dance_id: kizomba.id,
# )
# flavien.save!

# jerry = Partner.new(
#     gender: "Male",
#     name: "jerry",
#     age: "38",
#     location: "Paris",
#     email: "jerry@example.com",
#     password: "secret",
#     experience: "pro",
#     contact: "0600000002",
#     dance_id: kizomba.id,
# )
# jerry.save!

# amanda = Partner.new(
#     gender: "Female",
#     name: "Amanda",
#     age: "34",
#     location: "Paris",
#     email: "amanda@example.com",
#     password: "secret",
#     experience: "pro",
#     contact: "0600000003",
#     dance_id: tango.id,
# )
# amanda.save!

# puts "Create appointments..."
#   appointment_request_anthony = Appointment.create!(
#     user: anthony,
#     partner: amanda,
#     location: "Nantes",
# )
# appointment_request_anthony.save

#   appointment_call_anthony = Appointment.create!(
#     user: anthony,
#     partner: flavien,
#     location: "Paris",
# )

# appointment_call_anthony.save
# puts "Done!"
