class AddReferencesToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_reference :feeds, :profile, null: false, foreign_key: true
  end
end
