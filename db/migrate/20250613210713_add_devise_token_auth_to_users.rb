class AddDeviseTokenAuthToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :provider, null: false, default: 'email' unless column_exists?(:users, :provider)
      t.string :uid, null: false, default: '' unless column_exists?(:users, :uid)

      t.string :confirmation_token unless column_exists?(:users, :confirmation_token)
      t.datetime :confirmed_at unless column_exists?(:users, :confirmed_at)
      t.datetime :confirmation_sent_at unless column_exists?(:users, :confirmation_sent_at)
      t.string :unconfirmed_email unless column_exists?(:users, :unconfirmed_email)

      t.string :name unless column_exists?(:users, :name)
      t.string :image unless column_exists?(:users, :image)

      t.json :tokens unless column_exists?(:users, :tokens)
      t.boolean :allow_password_change, default: false unless column_exists?(:users, :allow_password_change)
    end

    add_index :users, [:uid, :provider], unique: true unless index_exists?(:users, [:uid, :provider])
    add_index :users, :confirmation_token, unique: true unless index_exists?(:users, :confirmation_token)
  end
end
