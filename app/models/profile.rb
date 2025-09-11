class Profile < ApplicationRecord
  # -----------------------------
  # Associations
  # -----------------------------
  belongs_to :user
  belongs_to :dance, optional: true
  has_one :feed, dependent: :destroy
  has_one_attached :avatar
  has_many :appointments, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :requests, dependent: :destroy

  # -----------------------------
  # Constants
  # -----------------------------
  INVESTISSEMENT = [
    'Social Dancer', 'Student Dancer', 'Training Dancer',
    'Coach', 'Artist', 'Choreographer'
  ].freeze

  NIVEAU = [
    'Novice - 0 to 1 XP year',
    'Intermédiaire - 1 to 3 XP years',
    'Avancé - 4 to 6 XP years',
    'Expert - 6+ years'
  ].freeze

  TRAINING_PER_WEEK = [
    '1 to 5 hours per week',
    '5 to 10 hours per week',
    '10 to 15 hours per week',
    '15 to 30 hours per week',
    '30+ hours per week'
  ].freeze

  LEVELS          = ['1', '2', '3', '4', '5'].freeze
  XPS             = (1..90).to_a.freeze
  COACHING_STATUS = ['novice', 'intermediaire', 'etudiant', 'teacher', 'jury'].freeze
  PRACTICE_A_WEEK = (1..60).to_a.freeze
  TECHNIQUE       = ['1', '2', '3', '4', '5'].freeze
  AMBITION        = ['teaching', 'social', 'professionnal', 'artistic'].freeze
  EMPATHIE        = ['none', 'social', 'professionnal', 'only_dancing'].freeze
  SOCIAL          = ['1', '2', '3', '4', '5'].freeze

  SKILLS = %w[level xp coaching_status practice_a_week technique ambition empathie social].freeze

  # -----------------------------
  # Validations
  # -----------------------------
  validates :user, presence: true
  validates :dance, presence: true, allow_nil: true

  # -----------------------------
  # Instance Methods
  # -----------------------------

  # Vérifie si toutes les compétences sont renseignées
  def all_skills_rated?
    SKILLS.all? { |skill| self[skill].present? }
  end

  # Calcul du pourcentage de compatibilité entre profils
  def matching_percentage(other_profile)
    return 0 unless other_profile

    total = SKILLS.sum do |skill|
      difference = (self[skill].to_i - other_profile[skill].to_i).abs
      case difference
      when 0 then 100
      when 1 then 75
      when 2 then 50
      when 3 then 25
      else 0
      end
    end

    # Normalisation sur 15 compétences
    (total.to_f / (SKILLS.size * 100) * 100).round(2)
  end

  # Retourne l'avatar de profil ou une image par défaut
  def avatar_url
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_url(avatar, only_path: true)
    else
      ActionController::Base.helpers.asset_path("default_profile.png")
    end
  end
end
