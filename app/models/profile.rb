class Profile < ApplicationRecord
  belongs_to :user

  validates_associated :user
  has_one_attached :avatar
  belongs_to :dance
  has_many :dances
  has_many :appointments

 INVESTISSEMENT = [
  'artiste',
  'coach',
  'hobbie',
  'apprenant'
  ]

  NIVEAU = [
    'debutant',
    'intermédiaire',
    'avancé',
    'expert'
  ]

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
end
