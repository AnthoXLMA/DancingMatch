class User < ApplicationRecord


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # omniauth :facebook
  # validates :facebook_uid, uniqueness: true, allow_nil: true

  # def self.from_omniauth(auth)
  #   user = User.where(provider: auth.provider, uid: auth.uid).first

  #   unless user
  #     user = User.create(
  #       provider: auth.provider,
  #       uid: auth.uid,
  #       name: auth.info.name,
  #       email: auth.info.email,
  #       facebook_token: auth.credentials.token
  #     )
  #   end

  #   user
  # end


  GENDER_TYPES    = ['Gentleman', 'Lady', 'Couple', 'Association']
  EXPERIENCE      = ['Débutant', 'Intermédiaire', 'Avancé']
  DANCES          = Dance.all
  LOCATION        = [Geocoder.search(:location)]
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

  has_many :subscriptions
  has_many :profiles, dependent: :destroy
  has_one_attached :photo
  has_many :meetings, through: :profiles
  has_many :appointments
  # has_one :dance
  has_many :dances, through: :appointments
  has_many :partners, through: :dances
  has_many :messages, through: :chatrooms
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 4 }
  # validates :last_name, length: { minimum: 3 }
  validates_confirmation_of :password

  after_create :build_profile


  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end
end
