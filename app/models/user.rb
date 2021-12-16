class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GENDER_TYPES    = ['Gentleman', 'Lady', 'Couple']
  DANCES          = Dance.all
  LOCATION        = []
  SKILLS          = %w[
    level
    xp
    coaching_status
    practice_a_week
    technique
    ambition
    empathie
    social
  ]

  LEVELS          = ['1', '2', '3', '4', '5']
  XPS             = (1..90)
  COACHING_STATUS = ['novice', 'intermediaire', 'etudiant', 'teacher', 'jury']
  PRACTICE_A_WEEK = (1..60)
  TECHNIQUE       = ['1', '2', '3', '4', '5']
  AMBITION        = ['teaching', 'social', 'professionnal', 'artistic']
  EMPATHIE        = ['none', 'social', 'professionnal', 'only_dancing']
  SOCIAL          = ['1', '2', '3', '4', '5']


  has_many :profiles
  has_one_attached :photo
  has_many :meetings, through: :profiles
  has_many :appointments, dependent: :delete_all
  # has_one :dance
  has_many :dances, through: :appointments
  has_many :partners, through: :dances
  has_many :messages, through: :chatrooms
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
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
