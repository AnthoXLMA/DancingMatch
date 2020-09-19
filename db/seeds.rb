puts "cleaning DB..."
Dance.destroy_all

dance_names = [
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

dance_names.each do|dance_name|
    dance = Dance.new(
      title: dance_name
    )
    dance.save!
  # 2.times do
    partner = Partner.new(
      pseudo: 'Anthony',
      gender: "Gentleman",
      age: "37",
      location: "Nantes",
      experience: "2",
      contact: "0600000033",
    )
    partner.dance = dance
    partner.save!

    partner = Partner.new(
      pseudo: 'Amanda',
      gender: "Lady",
      age: "33",
      location: "Nantes",
      experience: "8",
      contact: "0600110033",
    )
    partner.dance = dance
    partner.save!

    partner = Partner.new(
      pseudo: 'Sophie',
      gender: "Lady",
      age: "24",
      location: "Paris",
      experience: "5",
      contact: "0600002233",
    )
    partner.dance = dance
    partner.save!
  # end
end

# Partner.destroy_all
# Dance.destroy_all

# puts "Creating Partners..."
# partner_names = [
#   "Flavien",
#   "Damien",
#   "Joey",
#   "Sophie",
#   "Elodie",
#   "Melanie",
#   "Amanda",
#   "Henri",
#   "Patrick",
#   "Isis",
# ]

# partner_names.each do |partner_name|
#   partner = Partner.new(
#       pseudo: partner_name,
#       # gender: "Gentleman",
#       # age: "42",
#       # location: "Nantes",
#       # email: "elo.die@example.com",
#       # password: "secret",
#       # experience: "5",
#       # contact: "0600112233",
#       )
#   partner.save!

#   puts "Create dances..."
#   dance_names = [
#    "Rock",
#    "Tango",
#    "Merengue",
#    "Salsa Cubana",
#    "Salsa Portoricana",
#    "Bachata",
#    "Flamenco",
#    "Rumba",
#    "Paso Doble",
#    "Milonga",
#    "Lambada",
#    "Valse",
#    "West Coast Swing",
#    "Irish Taps",
#    "Country",
#    "Break Dance",
#    "Lindy Hop",
#    "Charleston",
#    "Shag",
#    "Blues",
#    "Boogie Woogie",
#    "FoxTrot",
#    "ChaCha"
#   ]
#   dance_names.each do|dance_name|
#     dance = Dance.new(
#       title: dance
#     )
#     dance.partner = partner
#     dance.save!
#     # sleep(2)
#   end
# end


# puts "cleaning DB..."
# Dance.delete_all
# Partner.delete_all
# # User.delete_all

# puts "Create dances..."
# dance_names = [
#  "Rock",
#  "Tango",
#  "Merengue",
#  "Salsa Cubana",
#  "Salsa Portoricana",
#  "Bachata",
#  "Flamenco",
#  "Rumba",
#  "Paso Doble",
#  "Milonga",
#  "Lambada",
#  "Valse",
#  "West Coast Swing",
#  "Irish Taps",
#  "Country",
#  "Break Dance",
#  "Lindy Hop",
#  "Charleston",
#  "Shag",
#  "Blues",
#  "Boogie Woogie",
#  "FoxTrot",
#  "ChaCha"
# ]
# dance_names.each do |dance|
#   dance = Dance.new(
#       title: dance
#     )
#   dance.save!
# end

# puts "CREATE PARTNERS..."
# # partner_names = [
# # "Elodie",
# # "Jerry",
# # "Amanda",
# # "Aurelien",
# # "Flavien",
# # "Julie",
# # "Bill",
# # "Homer"
# # ]

# elodie = Partner.new(
#   pseudo: "Elodie",
#   gender: "Lady",
#   age: "42",
#   location: "Nantes",
#   email: "elo.die@example.com",
#   password: "secret",
#   experience: "5",
#   contact: "0600112233",
#   dance: 'rock',
#   dance_id: Dance.ids,
#   )
# elodie.dance = 'rock'
# elodie.save

# bill = Partner.new(
#   pseudo: "Bill",
#   gender: "Gentleman",
#   age: "42",
#   location: "Nantes",
#   email: "roger@example.com",
#   password: "secret",
#   experience: "5",
#   contact: "0600112233",
#   dance: dance_names,
#   dance_id: Dance.select(1),
# )

# bill.dance = dance_names[1], dance_names[0], dance_names[12]
# bill.save

# sophie = Partner.new(
#   pseudo: "Sophie",
#   gender: "Lady",
#   age: "42",
#   location: "Nantes",
#   email: "dd@example.com",
#   password: "secret",
#   experience: "5",
#   contact: "0600112233",
#   dance: dance_names,
#   dance_id: Dance.select(0),
# )

# sophie.dance = dance_names[5], dance_names[3], dance_names[7]
# sophie.save

# homer = Partner.new(
#     pseudo: "Homer",
#     gender: "Gentleman",
#     age: "29",
#     location: "Paris",
#     email: "Adel@example.com",
#     password: "secret",
#     experience: "13",
#     contact: "0600000007",
#     dance: dance_names,
#     dance_id: Dance.select(0),
# )

# homer.dance = dance_names[0], dance_names[2], dance_names[5]
# homer.save

# flavien = Partner.new(
#     pseudo: "Flavien",
#     gender: "Gentleman",
#     age: "24",
#     location: "Lyon",
#     email: "flavien@example.com",
#     password: "secret",
#     experience: "4",
#     contact: "0600000001",
#     dance: dance_names,
#     dance_id: Dance.select(40),
# )

# flavien.dance = dance_names[2], dance_names[5], dance_names[9]
# flavien.save

# damien = Partner.new(
#     pseudo: "Damien",
#     gender: "Gentleman",
#     age: "38",
#     location: "Paris",
#     email: "jerry@example.com",
#     password: "secret",
#     experience: "12",
#     contact: "0600000002",
#     dance: dance_names,
#     dance_id: Dance.select('Tango'),
# )

# damien.dance = dance_names[2], dance_names[4], dance_names[9]
# damien.save

# josy = Partner.new(
#     pseudo: "Josy",
#     gender: "Lady",
#     age: "34",
#     location: "Paris",
#     email: "amanda@example.com",
#     password: "secret",
#     experience: "8",
#     contact: "0600000003",
#     # dance: dance_names,
#     dance_id: Dance.select(dance_names[12]),
#   )

# josy.dance = [dance_names[12], dance_names[7], dance_names[9]]
# josy.save

# # # puts "CREATE DANCES..."
# # # salsa = Dance.new(
# # #   name: "Salsa"
# # #   )
# # # salsa.save!

# # # bachata = Dance.new(
# # #   name: "Bachata",
# # #   )
# # # bachata.save!

# # # merengue = Dance.new(
# # #   name: "Merengue",
# # #   )
# # # merengue.save!

# # # kizomba = Dance.new(
# # #   name: "Kizomba",
# # #   )
# # # kizomba.save!

# # # rock = Dance.new(
# # #   name: "Rock",
# # #   )
# # # rock.save!

# # # wcs = Dance.new(
# # #   name: "West Coast Swing",
# # #   )
# # # wcs.save!

# # # zumba = Dance.new(
# # #   name: "Zumba",
# # #   )
# # # zumba.save!

# # # tango = Dance.new(
# # #   name: "Tango",
# # #   )
# # # tango.save!


# # # # users = []
# # # # users.appointments.each do |appointment|
# # # #   users << appointment.user
# # # # end

# # # puts "Create users..."
# # # anthony = User.new(
# # #     gender: "Male",
# # #     name: "Anthony",
# # #     age: "37",
# # #     location: "Paris",
# # #     email: "antho.mani@example.com",
# # #     password: "secret",
# # #     experience: "1",
# # #     contact: "0635158132",
# # #     # dance_id: "salsa.id",
# # #   )
# # # anthony.save!

# # # marc = User.new(
# # #     gender: "Male",
# # #     name: "Marc",
# # #     age: "37",
# # #     location: "Paris",
# # #     email: "antho.mani@example.com",
# # #     password: "secret",
# # #     experience: "1",
# # #     contact: "0635158132",
# # #     # dance_id: salsa.id,
# # #   )
# # # marc.save!

# # # edouard = User.new(
# # #     gender: "Male",
# # #     name: "Edouard",
# # #     age: "37",
# # #     location: "Paris",
# # #     email: "antho.mani@example.com",
# # #     password: "secret",
# # #     experience: "1",
# # #     contact: "0635158132",
# # #   )
# # # edouard.save!

# # # # anthony.partners

# # # # julien = User.new(
# # # #     gender: "Male",
# # # #     name: "Julien",
# # # #     age: "19",
# # # #     location: "Marseille",
# # # #     email: "julien.de@example.com",
# # # #     password: "secret",
# # # #     experience: "5",
# # # #     contact: "0600010203",
# # # # )
# # # # julien.save!

# # # # puts "retrieving user dance..."
# # # # dance = Dance.last
# # # # users = []
# # # # dance.appointments.each do |appointment|
# # # #   users << appointment.user
# # # # end

# # # METHODE NICKNAME -----------------------------------------
# # # def today_my_buddys_github_nickname_is
# # #   # TODO: Return the GitHub nickname of your buddy.
# # #   nickname = "AnthoXLMA"
# # #   return nickname
# # # end
# # # p nickname

# # # METHODES EXEMPLES -----------------------------------------
# # # def get_rid_of_surrounding_whitespaces(a_string)
# # #   # TODO: return a copy of the string with leading and trailing whitespaces removed
# # #   # example: get_rid_of_surrounding_whitespaces("  hey yo  ") => "hey yo"
# # #   #=> "hello"
# # #   return a_string.strip
# # # end
# # # puts get_rid_of_surrounding_whitespaces("      hello    ")

# # # def belongs_to?(a_string, a_word)
# # #   # TODO: return true if a_string contains a_word
# # #   # example: belongs_to?("hey jude", "jude") => true
# # #   if a_string.include? a_word
# # #     return true
# # #   else false
# # #   end
# # # end
# # # puts belongs_to?("Hello All", "you")

# # # def replace(initial_string, old_letter, new_letter)
# # #   # TODO: return a copy of the string with the new letter replacing the old one
# # #   # example: replace("casanova", "a", "o") => "cosonovo"
# # #   initial_string.gsub(old_letter, new_letter)
# # # end
# # # puts replace("Casanova", "a", "B")

# # # def exactly_divide(an_integer, a_divider)
# # #   # TODO: return division of an_integer by a_divider (computing the floating division, NOT the euclidean one)
# # #   # example: exactly_divide(13, 4) => 3.25
# # #   return an_integer.fdiv(a_divider)
# # # end
# # # puts exactly_divide(10, 2)

# # # def divisible_by_two?(an_integer)
# # #   # TODO: return true if an_integer is divisible by 2
# # #   # example: divisible_by_two?(6) => true
# # #   if an_integer.even?
# # #     return true
# # #   else false
# # #   end
# # # end
# # # puts divisible_by_two?(32)

# # # def random_subset(an_array, sample_size)
# # #   # TODO: return a random subset of an_array with size sample_size
# # #   # example: random_subset(('a'..'z').to_a, 4) => ["u", "q", "l", "t"]
# # #   # la methode sample melange les elements dans le array et sample_size recupere le nombre d'elements demandes
# # #   an_array.sample(sample_size)
# # # end
# # # puts random_subset([1, 2, 3, 4, 5, 6, 7], 3)

# # # def randomize(an_array)
# # #   # TODO: return a randomized copy of an_array
# # #   # example: randomize([1, 2, 3, 4]) => [2, 1, 4, 3]
# # #   an_array.shuffle
# # # end
# # # p randomize([1, 2, 3, 4, 5])

# # # def ascending_order(an_array)
# # #   an_array.sort
# # # end
# # # p ascending_order([4, 6, 8, 34, 65, 22, 1])

# # # AGE IN DAYS ------------------------------------------------------

# # # require 'date'

# # # def age_in_days(day, month, year)
# # #   my_age = Date.today - Date.new(year, month, day)
# # #   return my_age.to_i
# # # end

# # # puts age_in_days(23, 4, 1964)

# # # AGE IN DAYS INTERFACE ------------------------------------


# # # WHATS YOUR NAME ---------------------------
# # # def compute_name(first_name, middle_name, last_name)
# # #   # TODO: return full name using string interpolation
# # #   return "#{first_name} #{middle_name} #{last_name}"
# # # end

# # # puts compute_name("Eloise", "Renée", "Michelle")

# # # WHATS YOUR NAME INTERFACE ------------------------------------
# # # require_relative "compute_name"

# # # # TODO: ask for the first name
# # # puts "What is your first name?"
# # # first_name = gets.chomp
# # # # TODO: ask for the middle name
# # # puts "What is your middle name?"
# # # middle_name = gets.chomp
# # # # TODO: ask for the last name
# # # puts "What is your last name?"
# # # last_name = gets.chomp
# # # # TODO: Print a greeting to the user with the full name concatenated,
# # # #       something like "Hello, Boris Paillard"
# # # greetings = "Hello, #{first_name} #{middle_name} #{last_name}!"

# # # puts greetings

# # # STUPID COACHING -------------------
# # # def coach_answer(your_message)
# # #   if your_message.downcase == "i am going to work right now!"
# # #     ""
# # #   elsif your_message.end_with?("?")
# # #     "Silly question, get dressed and go to work!"
# # #   else
# # #     "I don't care, get dressed and go to work!"
# # #   end
# # # end

# # # def coach_answer_enhanced(your_message)
# # #   answer = coach_answer(your_message)
# # #   if answer != ""
# # #     if your_message.upcase == your_message
# # #       "I can feel your motivation! #{answer}"
# # #     else
# # #       answer
# # #     end
# # #   else
# # #     ""
# # #   end
# # # end

# # # STUPID COACHING °2 (interface) --------------------
# # # require_relative "coach_answer"

# # # puts "Hello, I am your coach, what do you want?"

# # # answer = nil

# # # while answer != ""
# # #   print "> "
# # #   message = gets.chomp
# # #   answer = coach_answer_enhanced(message)
# # #   puts answer
# # # end

# # # puts "Great, see ya!"

# # # COLOURFUL ALGORITHMS
# # # def colorful?(number)
# # #   digits = digits(number)
# # #   products = digit_subset_products(digits)
# # #   products == products.uniq
# # # end

# # # def digits(number)
# # #   digits = []
# # #   number.to_s.split('').each do |digit|
# # #     digits << digit.to_i
# # #   end
# # #   digits
# # # end

# # # def digit_subset_products(digits)
# # #   products = []
# # #   (1..digits.size).each do |i|
# # #     (0..(digits.size - i)).each do |j|
# # #       product = 1
# # #       digits[j...(j + i)].each do |digit_subset|
# # #         product = product * digit_subset
# # #       end
# # #       products << product
# # #     end
# # #   end
# # #   products
# # # end

# # # ADRESS IP CONVERTER
# # # def ip_to_num(ip_address)
# # #   # TODO: return the number version of the `ip_address` string
# # # end

# # # def num_to_ip(number)
# # #   # TODO: return the string IP address from the `number`
# # # end

# # # APPOINTMENTS ------------------------------------------------------
# # # # puts "Create appointments..."
# # # #   appointment_request_anthony = Appointment.create!(
# # # #     user: anthony,
# # # #     partner: flavien,
# # # #     location: "Nantes",
# # # # )
# # # # appointment_request_anthony.save

# # # #   appointment_call_anthony = Appointment.create!(
# # # #     user: anthony,
# # # #     partner: amanda,
# # # #     location: "Paris",
# # # # )

# # # # appointment_call_anthony.save
# # # # puts "Done!"
