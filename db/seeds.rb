puts "cleaning DB..."
Partner.destroy_all
User.destroy_all
Dance.destroy_all
Appointment.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts "Creating dances..."
dance1 = Dance.new(title: "Salsa Cubana")
dance1.save!

dance2 = Dance.new(title: "Merengue")
dance2.save!

dance3 = Dance.new(title: "Bachata")
dance3.save!

dance4 = Dance.new(title: "Kizomba")
dance4.save!

dance5 = Dance.new(title: "Reggaeton")
dance5.save!

dance6 = Dance.new(title: "Samba")
dance6.save!

dance7 = Dance.new(title: "Tango")
dance7.save!

dance8 = Dance.new(title: "Flamenco")
dance8.save!

dance9 = Dance.new(title: "Modern Jazz")
dance9.save!

dance10 = Dance.new(title: "Rumba")
dance10.save!

dance11 = Dance.new(title: "West Coast Swing")
dance11.save!

dance12 = Dance.new(title: "Break Dance")
dance12.save!

dance13 = Dance.new(title: "Salsa Portoricana")
dance13.save!

dance14 = Dance.new(title: "Salsa Colombiana")
dance14.save!

dance15 = Dance.new(title: "FoxTrot")
dance15.save!

dance16 = Dance.new(title: "Lindy Hop")
dance16.save!

dance17 = Dance.new(title: "Paso Doble")
dance17.save!

dance18 = Dance.new(title: "Milonga")
dance18.save!

dance19 = Dance.new(title: "Lambada")
dance19.save!

dance20 = Dance.new(title: "Forro")
dance20.save!

# SEEDS 1 avec dance
puts 'Creating Users...'
anthony = User.new(
  first_name: 'Anthony',
  age: "37",
  email: "antho@example.com",
  password: "secret",
  # encrypted_password: "password",
  location: "Paris",
  experience: "3",
  contact: "06023002233",
  dance: dance6,
  )
anthony.save!

jimmy = User.new(
  first_name: 'Jimmy',
  age: "30",
  email: "jimmy@example.com",
  password: "secret",
  # encrypted_password: "password",
  location: "Marseille",
  experience: "1",
  contact: "06025002233",
  dance: dance2,
)
jimmy.save!


stephanie = User.new(
  first_name: 'Stephanie',
  age: "32",
  email: "steph@example.com",
  password: "secret",
  experience: "16",
  location: "La Havane",
  contact: "0600000033",
  dance: dance5,
)
stephanie.save

peter = User.new(
  first_name: 'Peter',
  age: "28",
  email: "peter@example.com",
  password: "secret",
  location: "Berlin",
  experience: "8",
  contact: "0600110033",
  dance: dance3,
)
peter.save


#SEEDS 2 avec dance_id
# puts 'Creating Users...'
# anthony = User.new(
#   pseudo: 'Anthony',
#   gender: "Gentleman",
#   age: "37",
#   email: "antho@example.com",
#   password: "secret",
#   # encrypted_password: "password",
#   location: "Paris",
#   experience: "3",
#   contact: "06023002233",
#   dance_id: '4',
#   )
# anthony.save!

# jimmy = User.new(
#   pseudo: 'Jimmy',
#   gender: "Gentleman",
#   age: "30",
#   email: "jimmy@example.com",
#   password: "secret",
#   # encrypted_password: "password",
#   location: "Marseille",
#   experience: "1",
#   contact: "06025002233",
#   dance_id: '8',
# )
# jimmy.save!


puts 'Creating Partners...'
adel = Partner.new(
  pseudo: 'Adel',
  gender: "Gentleman",
  age: "32",
  experience: "16",
  location: "La Havane",
  contact: "0600000033",
  dance_id: '3',
)
# anthony.dances = dances
adel.save

sylvia = Partner.new(
  pseudo: 'Sylvia',
  gender: "Lady",
  age: "28",
  location: "Berlin",
  experience: "8",
  contact: "0600110033",
  dance_id: '9',
)
# zita.dances = dances
sylvia.save

vanessa = Partner.new(
  pseudo: 'Vanessa',
  gender: "Lady",
  age: "24",
  location: "Paris",
  experience: "5",
  contact: "0600002233",
  dance_id: '12'
)
vanessa.save

  john = Partner.new(
  pseudo: 'John',
  gender: "Gentleman",
  age: "37",
  location: "Nantes",
  experience: "2",
  contact: "0600000033",
  dance_id: '14'
)
john.save

amanda = Partner.new(
  pseudo: 'Amanda',
  gender: "Lady",
  age: "27",
  location: "Nantes",
  experience: "8",
  contact: "0600110033",
  dance_id: '3',
)
amanda.save

marion = Partner.new(
  pseudo: 'Marion',
  gender: "Lady",
  age: "48",
  location: "Paris",
  experience: "5",
  contact: "0600002233",
  dance_id: '8'
)
marion.save

  didier = Partner.new(
  pseudo: 'Didier',
  gender: "Gentleman",
  age: "49",
  location: "Nantes",
  experience: "2",
  contact: "0600000033",
  dance_id: '8'
)
didier.save

bob = Partner.new(
  pseudo: 'Bob',
  gender: "Gentleman",
  age: "78",
  experience: "16",
  location: "Londres",
  contact: "0600000033",
  dance_id: '1',
)
# anthony.dances = dances
bob.save

ludo = Partner.new(
  pseudo: 'Ludo',
  gender: "Gentleman",
  age: "28",
  location: "Paris",
  experience: "8",
  contact: "0600110033",
  dance_id: '12',
)
# zita.dances = dances
sylvia.save

olivier = Partner.new(
  pseudo: 'Olivier',
  gender: "Gentleman",
  age: "24",
  location: "Paris",
  experience: "5",
  contact: "0600002233",
  dance_id: '12'
)
olivier.save

  cedric = Partner.new(
  pseudo: 'Cedric',
  gender: "Gentleman",
  age: "37",
  location: "Nantes",
  experience: "2",
  contact: "0600000033",
  dance_id: '14'
)
john.save

cecile = Partner.new(
  pseudo: 'Cecile',
  gender: "Lady",
  age: "27",
  location: "Paris",
  experience: "8",
  contact: "0600110033",
  dance_id: '11',
)
cecile.save

nath = Partner.new(
  pseudo: 'Nath',
  gender: "Lady",
  age: "48",
  location: "Paris",
  experience: "5",
  contact: "0600002233",
  dance_id: '5'
)
nath.save

  philippe = Partner.new(
  pseudo: 'Philippe',
  gender: "Gentleman",
  age: "49",
  location: "Nantes",
  experience: "2",
  contact: "0600000033",
  dance_id: '7'
)
philippe.save

tony = User.create(email: "ma@lewagon.org", password: "chatroom", nickname: "Tony")
antho = User.create(email: "am@lewagon.org", password: "chatroom", nickname: "Antho")

general = Chatroom.create(name: "general")

Message.create(chatroom: general, user: tony, content: "Hello all :wave:")
Message.create(chatroom: general, user: antho, content: "Hello Seb :wave:")
Message.create(chatroom: general, user: antho, content: "Action Cable rocks :rocket:")
Message.create(chatroom: general, user: tony, content: "It seems we have N+1 queries though, let's fix that :ok_hand:")

# Appointments
# # # # # puts "retrieving user dance..."
# # # # # dance = Dance.last
# # # # # users = []
# # # # # dance.appointments.each do |appointment|
# # # # #   users << appointment.user
# # # # # end

# # # # APPOINTMENTS ------------------------------------------------------
puts "Create appointments..."
  appointment_request_anthony = Appointment.create!(
    user: anthony,
    partner: didier,
    location: "Nantes",
)
appointment_request_anthony.save

  appointment_call_anthony = Appointment.create!(
    user: anthony,
    partner: amanda,
    location: "Paris",
)

appointment_call_anthony.save
puts "Done!"

puts 'Creating appointments 1...'
new_appointment = Appointment.new(user_id: '4', location: "Paris", date: "23/02/2021", partner_id: '3')
new_appointment.save!
vanessa = Appointment.new(user_id: '2', location: "Paris", date: "23/02/2021", partner_id: '5')
vanessa.save!
adel = Appointment.new(user_id: '1', location: "Paris", date: "23/02/2021", partner_id: '5')
adel.save!
puts 'Finished!'




