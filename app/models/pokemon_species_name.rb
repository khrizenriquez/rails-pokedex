class PokemonSpeciesName < ApplicationRecord
	self.primary_key = 'pokemon_species_id'
	has_one :pokemon
end
