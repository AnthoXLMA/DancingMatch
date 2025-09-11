class ConvertTokensToJsonb < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:users, :tokens)
      # Convertit la colonne en jsonb
      change_column :users, :tokens, 'jsonb USING tokens::jsonb'

      # Ajoute un index GIN pour accélérer les recherches sur JSON
      add_index :users, :tokens, using: :gin unless index_exists?(:users, :tokens, using: :gin)
    end
  end
end
