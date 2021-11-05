class Profile < ApplicationRecord
  belongs_to :user
  validates_associated :user

  has_one_attached :avatar
  belongs_to :dance
  has_one :feed
  has_many :dances
  has_many :appointments
  has_many :meetings
  has_many :requests, dependent: :destroy

 INVESTISSEMENT = [
  'Social Dancer',
  'Student Dancer',
  'Training Dancer',
  'Coach',
  'Artist',
  'Choreographer'
  ]

  NIVEAU = [
    'Novice - 0 to 1 XP year',
    'Intermédiaire - 1 to 3 XP years',
    'Avancé - 4 to 6 XP years',
    'Expert - 6 years min.'
  ]

  TRAINING_per_Week = [
    '1 to 5 hours per week',
    '5 to 10 hours per week',
    '10 to 15 hours per week',
    '15 to 30 hours per week',
    '30 hours min. per week'
  ]

  # SKILLS = %w[
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

  # def matching_percentage_calc
  #   skills_cases = SKILLS.map do |skill|
  #     <<~STRING
  #       (
  #         CASE
  #           WHEN profiles.#{skill}       <= #{self[skill]} THEN 100
  #           WHEN (profiles.#{skill} - 1) <= #{self[skill]} THEN 75
  #           WHEN (profiles.#{skill} - 2) <= #{self[skill]} THEN 50
  #           WHEN (profiles.#{skill} - 3) <= #{self[skill]} THEN 25
  #           ELSE
  #             0
  #         END
  #       )
  #     STRING
  #   end
  #   skills_query = skills_cases.join(" +\n")
  #   <<~SQL
  #     ( ({skills_query}) / 15::decimal )
  #   SQL
  # end

  # def all_skills_rated?
  #   SKILLS.all? { |skill| self[skill].present? }
  # end
end
