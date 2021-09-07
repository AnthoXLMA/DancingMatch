class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :dance

  GENDER_TYPES = ['Gentleman', 'Lady']

  DANCES = ['Salsa', 'BreakDance', 'Hip-Hop', 'Reggaeton', 'Kizomba']

  DANCER_SKILLS = %w[
  interpersonal_skills
  rigor
  independence
  communication
  teamwork
  creativity
  initiative
  stress_management
  perseverance
  decision_making
  curiosity
  adaptability
  enthusiam
  flexibility
  empathy
]

  has_one :profile

  has_many :messages, through: :chatrooms
  has_many :appointments, dependent: :delete_all
  has_many :dances, through: :appointments
  has_many :dance_id
  has_many :partners, through: :dances

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :first_name, presence: true, length: { minimum: 8 }
  validates :last_name, length: { minimum: 5 }
  validates_confirmation_of :password
end
