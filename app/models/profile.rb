class Profile < ApplicationRecord
  belongs_to :user, dependent: :delete

  validates_associated :user
  has_one_attached :avatar
  belongs_to :dance
  has_many :dances
  has_many :appointments

 INVESTISSEMENT = [
  'Artiste',
  'Coach',
  'Hobbie',
  'Elève'
  ]

  NIVEAU = [
    'Débutant',
    'Intermédiaire',
    'Avancé',
    'Expert'
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
