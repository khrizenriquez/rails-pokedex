class AddSlugToPokemonAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemon_assets, :slug, :string
  end
end
