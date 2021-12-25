class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  belongs_to  :dance
  has_one     :feed
  has_many    :dances
  has_many    :appointments
  has_many    :meetings
  has_many    :requests, dependent: :destroy

 INVESTISSEMENT = [
  'Social Dancer',
  'Student Dancer',
  'Training Dancer',
  'Coach',
  'Artist',
  'Choreographer'
  ]

  NIVEAU = [
    'Novice - 0 to. 1 XP year',
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

  # SKILLS = %W[
  #   level
  #   xp
  #   coaching_status
  #   practice_a_week
  #   technique
  #   ambition
  #   empathie
  #   social
  # ]

  def matching_percentage_calc
   <<~PLOP
     ( round(
         100.0 * (
           (CASE WHEN profiles.level <= '#{level}' THEN 1  ELSE 0 END) +
           (CASE WHEN profiles.xp <= '#{xp}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.coaching_status <= '#{coaching_status}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.practice_a_week <= '#{practice_a_week}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.technique <= '#{technique}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.ambition <= '#{ambition}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.empathie <= '#{empathie}' THEN 1 ELSE 0 END) +
           (CASE WHEN profiles.social <= '#{social}' THEN 1 ELSE 0 END) +
         )
         / 15
       , 2)
     )
   PLOP
  end

  def matching_percentage_calc
  <<~PLOP
    (
      (
        (CASE WHEN profiles.level::int - 3 <= '#{level}' THEN 100 - (profiles.level::int - '#{level}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.xp::int - 3 <= '#{xp}' THEN 100 - (profiles.xp::int - '#{xp}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.coaching_status::int - 3 <= '#{coaching_status}' THEN 100 - (profiles.coaching_status::int - '#{coaching_status}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.practice_a_week::int - 3 <= '#{practice_a_week}' THEN 100 - (profiles.practice_a_week::int - '#{practice_a_week}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.technique::int - 3 <= '#{technique}' THEN 100 - (profiles.technique::int - '#{technique}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.ambition::int - 3 <= '#{ambition}' THEN 100 - (profiles.ambition::int - '#{ambition}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.empathie::int - 3 <= '#{empathie}' THEN 100 - (profiles.empathie::int - '#{empathie}'::int) * 25  ELSE 0 END) +
        (CASE WHEN profiles.social::int - 3 <= '#{social}' THEN 100 - (profiles.social::int - '#{social}'::int) * 25  ELSE 0 END) +
      )
      / 15
    )
  PLOP
end

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
end
