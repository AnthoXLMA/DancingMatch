class User < ApplicationRecord
  # -----------------------------
  # Devise authentication
  # -----------------------------
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  # -----------------------------
  # Geocoding
  # -----------------------------
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # -----------------------------
  # Associations
  # -----------------------------
  has_many :subscriptions, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :dances, through: :appointments
  has_many :partners, through: :dances
  has_many :meetings, through: :profiles
  has_many :messages, through: :chatrooms
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_one_attached :photo

  # -----------------------------
  # Validations
  # -----------------------------
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :gender, inclusion: { in: %w[Gentleman Lady Couple Association] }

  # -----------------------------
  # Constants for forms / selections
  # -----------------------------
  GENDER_TYPES    = ['Gentleman', 'Lady', 'Couple', 'Association'].freeze
  EXPERIENCE_LEVELS = ['Débutant', 'Intermédiaire', 'Avancé'].freeze
  LEVELS          = ['1', '2', '3', '4', '5'].freeze
  XPS             = (1..90).to_a.freeze
  COACHING_STATUS = ['novice', 'intermediaire', 'etudiant', 'teacher', 'jury'].freeze
  PRACTICE_A_WEEK = (1..60).to_a.freeze
  TECHNIQUE       = ['1', '2', '3', '4', '5'].freeze
  AMBITION        = ['teaching', 'social', 'professionnal', 'artistic'].freeze
  EMPATHIE        = ['none', 'social', 'professionnal', 'only_dancing'].freeze
  SOCIAL          = ['1', '2', '3', '4', '5'].freeze

  # -----------------------------
  # Callbacks
  # -----------------------------
  after_create :build_profile

  def build_profile
    # Crée automatiquement un profil pour l'utilisateur après création
    profiles.create!
  end

  # -----------------------------
  # Instance Methods
  # -----------------------------

  # Retourne l'image correspondant au genre de l'utilisateur
  def gender_image
    case gender
    when "Gentleman"
      "dancing_man.png"
    when "Lady"
      "dancing_woman.png"
    else
      "dancing_couple.png"
    end
  end

  # Vérifie si l'utilisateur a un avatar attaché
  def avatar_url
    if photo.attached?
      Rails.application.routes.url_helpers.rails_blob_url(photo, only_path: true)
    else
      helpers.asset_path(gender_image)
    end
  end

  # Retourne l'âge sous forme lisible (ex: "32 ans")
  def display_age
    age.present? ? "#{age} ans" : "Non renseigné"
  end

  # Retourne l'expérience sous forme lisible
  def display_experience
    experience.present? ? "#{experience} ans" : "Non renseignée"
  end
end
