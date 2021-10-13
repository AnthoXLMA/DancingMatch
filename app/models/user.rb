class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GENDER_TYPES = ['Gentleman', 'Lady']

  DANCES = Dance.all
  USER_DANCES = DANCES.select do |dance|
    dance.title
  end

#   SKILLS = %w[
#   interpersonal_skills
#   rigor
#   independence
#   communication
#   teamwork
#   creativity
#   initiative
#   stress_management
#   perseverance
#   decision_making
#   curiosity
#   adaptability
#   enthusiam
#   flexibility
#   empathy
# ]

  has_many :profiles
  has_one_attached :photo

  has_many :appointments, dependent: :delete_all
  has_many :dances
  has_many :dances, through: :appointments
  has_many :partners, through: :dances
  has_many :messages, through: :chatrooms


  geocoded_by :location
    after_validation :geocode, if: :will_save_change_to_location?

  validates :first_name, presence: true, length: { minimum: 4 }
  validates :last_name, length: { minimum: 3 }
  validates_confirmation_of :password

  after_create :build_profile
  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end
end
