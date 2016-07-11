class PokemonAsset < ApplicationRecord
	has_one :pokemon
	has_one :type
end
