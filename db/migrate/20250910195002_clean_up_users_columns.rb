class CleanUpUsersColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password, :string if column_exists?(:users, :password)
    remove_column :users, :xp, :string if column_exists?(:users, :xp)
    remove_column :users, :level, :string if column_exists?(:users, :level)
    remove_column :users, :coaching_status, :string if column_exists?(:users, :coaching_status)
    remove_column :users, :practice_a_week, :string if column_exists?(:users, :practice_a_week)
    remove_column :users, :technique, :string if column_exists?(:users, :technique)
    remove_column :users, :ambition, :string if column_exists?(:users, :ambition)
    remove_column :users, :empathie, :string if column_exists?(:users, :empathie)
    remove_column :users, :social, :string if column_exists?(:users, :social)
  end
end
