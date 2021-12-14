# def matching_percentage_calc
#   <<~PLOP
#     (
#       (
#         (CASE WHEN profiles.level::int - 3 <= '#{level}' THEN 100 - (profiles.level::int - '#{level}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.xp::int - 3 <= '#{xp}' THEN 100 - (profiles.xp::int - '#{xp}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.coaching_status::int - 3 <= '#{coaching_status}' THEN 100 - (profiles.coaching_status::int - '#{coaching_status}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.practice_a_week::int - 3 <= '#{practice_a_week}' THEN 100 - (profiles.practice_a_week::int - '#{practice_a_week}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.technique::int - 3 <= '#{technique}' THEN 100 - (profiles.technique::int - '#{technique}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.ambition::int - 3 <= '#{ambition}' THEN 100 - (profiles.ambition::int - '#{ambition}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.empathie::int - 3 <= '#{empathie}' THEN 100 - (profiles.empathie::int - '#{empathie}'::int) * 25  ELSE 0 END) +
#         (CASE WHEN profiles.social::int - 3 <= '#{social}' THEN 100 - (profiles.social::int - '#{social}'::int) * 25  ELSE 0 END) +
#       )
#       / 15
#     )
#   PLOP
# end
