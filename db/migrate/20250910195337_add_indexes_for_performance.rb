class AddIndexesForPerformance < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :city unless index_exists?(:users, :city)
    add_index :profiles, :level unless index_exists?(:profiles, :level)
  end
end
