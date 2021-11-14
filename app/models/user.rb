class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GENDER_TYPES = ['Gentleman', 'Lady', 'Couple']
  DANCES = Dance.all
  LOCATION = ['Berlin', 'Paris', 'Madrid']
  SKILLS = %w[
    level
    xp
    coaching_status
    practice_a_week
    technique
    ambition
    empathie
    social
  ]

  LEVELS = ['1', '2', '3', '4', '5']
  XPS = (1..90)
  COACHING_STATUS = ['novice', 'intermediaire', 'etudiant', 'teacher', 'jury']
  PRACTICE_A_WEEK = (1..60)
  TECHNIQUE = ['1', '2', '3', '4', '5']
  AMBITION = ['teaching', 'social', 'professionnal', 'artistic']
  EMPATHIE = ['none', 'social', 'professionnal', 'only_dancing']
  SOCIAL = ['1', '2', '3', '4', '5']


  has_many :profiles, dependent: :destroy
  has_one_attached :photo
  has_many :meetings, through: :profiles
  has_many :appointments, dependent: :delete_all
  has_one :dance
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

  def matching_percentage_calc
      skills_cases = SKILLS.map do |skill|
        <<~STRING
          (
            CASE
              WHEN profiles.#{skill}       <= #{self[skill]} THEN 100
              WHEN (profiles.#{skill} - 1) <= #{self[skill]} THEN 75
              WHEN (profiles.#{skill} - 2) <= #{self[skill]} THEN 50
              WHEN (profiles.#{skill} - 3) <= #{self[skill]} THEN 25
              ELSE
                0
            END
          )
        STRING
      end
    skills_query = skills_cases.join(" +\n")
    <<~SQL
      ( ({skills_query}) / 15::decimal )
    SQL
  end

  def all_skills_rated?
    SKILLS.all? { |skill| self[skill].present? }
  end

  # def last_skill?
  #   SOFT_SKILLS.last
  # end

  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end
end
