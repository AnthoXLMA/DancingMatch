class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
#    DANCES = %w[
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

  has_one_attached :profile_pic
  belongs_to :dance
  has_many :appointments
  has_many :partners, through: :appointments

  validates :pseudo, presence: true
end
