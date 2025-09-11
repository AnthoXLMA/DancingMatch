puts "Cleaning DB..."
# Supprime tout et réinitialise les IDs
Appointment.destroy_all
Profile.destroy_all
User.destroy_all
Dance.destroy_all

ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE dances_id_seq RESTART WITH 1")

puts "Creating dances..."
dance_titles = [
  "Salsa Cubana", "Merengue", "Bachata", "Kizomba", "Reggaeton", "Samba",
  "Tango", "Flamenco", "Modern Jazz", "Rumba", "West Coast Swing", "Break Dance",
  "Salsa Portoricana", "Salsa Colombiana", "FoxTrot", "Lindy Hop", "Paso Doble",
  "Milonga", "Lambada", "Forro", "Madison", "Son Cubano", "Boogie Woogie",
  "Rock 'n' Roll", "Tap Dance", "Rubbish Looping", "Hip Hop", "Cha Cha Cha",
  "Valse", "Capoeira", "Zumba", "Pole Dance", "Cha Cha Son", "Kompa", "Zouk"
]

dances = dance_titles.map { |title| Dance.create!(title: title) }
puts "Dances created: #{Dance.count}"

puts "Creating users..."
users_data = [
  {first_name: "Anthony", last_name: "Durand", email: "anthony@gmail.com", password: "secret123", age: 35, gender: "Gentleman", location: "Marseille", experience: 7},
  {first_name: "Jimmy", last_name: "Martin", email: "jimmy@gmail.com", password: "secret123", age: 30, gender: "Gentleman", location: "Paris", experience: 5},
  {first_name: "Stephanie", last_name: "Lopez", email: "stephanie@gmail.com", password: "secret123", age: 32, gender: "Lady", location: "La Havane", experience: 16},
  {first_name: "Peter", last_name: "Schmidt", email: "peter@gmail.com", password: "secret123", age: 28, gender: "Gentleman", location: "Berlin", experience: 8}
]

users = users_data.map do |user_data|
  # Utilisation de find_or_create_by pour éviter les conflits sur uid/provider
  User.find_or_create_by!(email: user_data[:email]) do |u|
    u.first_name = user_data[:first_name]
    u.last_name = user_data[:last_name]
    u.password = user_data[:password]
    u.age = user_data[:age]
    u.gender = user_data[:gender]
    u.location = user_data[:location]
    u.experience = user_data[:experience]
    u.uid = nil           # important pour Devise + OmniAuth
    u.provider = "email"  # ou nil si non nécessaire
  end
end

puts "Users created: #{User.count}"

puts "Seeding complete! 🎉"
