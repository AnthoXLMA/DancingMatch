class MigrateProfileScores < ActiveRecord::Migration[7.1]
  def up
    Profile.find_each do |profile|
      # Crée un record dans profile_attributes avec les valeurs existantes
      ProfileAttribute.create!(
        profile_id: profile.id,
        ambition: profile.ambition.to_i,
        social: profile.social.to_i,
        technique: profile.technique.to_i,
        empathie: profile.empathie.to_i
      )
    end
  end

  def down
    # Supprime tous les enregistrements créés (rollback)
    ProfileAttribute.delete_all
  end
end
