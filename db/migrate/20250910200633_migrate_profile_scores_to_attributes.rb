class MigrateProfileScoresToAttributes < ActiveRecord::Migration[7.1]
  def up
    Profile.find_each do |profile|
      ProfileAttribute.create!(
        profile: profile,
        ambition: profile.ambition.to_i,
        social: profile.social.to_i,
        technique: profile.technique.to_i,
        empathie: profile.empathie.to_i
      )
    end
  end

  def down
    ProfileAttribute.delete_all
  end
end
