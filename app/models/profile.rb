class Profile < ApplicationRecord
  belongs_to :user

  validates_associated :user
  has_one_attached :avatar
  belongs_to :dance
  has_many :dances
  has_many :appointments

 INVESTISSEMENT = [
  'Social Dancer',
  'Student Dancer',
  'Training Dancer',
  'Show Dancer'
  ]

  NIVEAU = [
    'Novice - 0 to 1 XP year',
    'Intermédiaire - 1 to 3 XP years',
    'Avancé - 4 to 6 XP years',
    'Expert - 6 years min.'
  ]

  TRAINING_per_Week = (1..64)

# '1 to 5 hours per week',
#     '5 to 10 hours per week',
#     '10 to 15 hours per week',
#     '15 to 30 hours per week',
#     '30 hours min. per week',

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
