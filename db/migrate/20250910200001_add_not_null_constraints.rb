class AddNotNullConstraints < ActiveRecord::Migration[7.1]
  def change
    # Vérifie que les colonnes existent avant d'ajouter la contrainte
    change_column_null :users, :email, false if column_exists?(:users, :email)
    change_column_null :users, :encrypted_password, false if column_exists?(:users, :encrypted_password)

    change_column_null :profiles, :user_id, false if column_exists?(:profiles, :user_id)
    change_column_null :profiles, :dance_id, false if column_exists?(:profiles, :dance_id)
  end
end
