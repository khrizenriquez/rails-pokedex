json.array!(@pokemon_assets) do |pokemon_asset|
  json.extract! pokemon_asset, :id, :pokemon_id, :type_id
  json.url pokemon_asset_url(pokemon_asset, format: :json)
end
