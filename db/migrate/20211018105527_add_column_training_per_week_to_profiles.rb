class AddColumnTrainingPerWeekToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :training_per_week, :integer
  end
end
