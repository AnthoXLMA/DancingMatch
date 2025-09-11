class HarmonizeDataTypes < ActiveRecord::Migration[7.1]
  def change
    change_column :profiles, :practice_a_week, :integer, using: 'practice_a_week::integer' if column_exists?(:profiles, :practice_a_week)
    change_column :users, :latitude, :decimal, precision: 10, scale: 6, using: 'latitude::decimal' if column_exists?(:users, :latitude)
    change_column :users, :longitude, :decimal, precision: 10, scale: 6, using: 'longitude::decimal' if column_exists?(:users, :longitude)
  end
end
