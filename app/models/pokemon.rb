class Pokemon < ApplicationRecord
	belongs_to :pokemon_species_name, 
	foreign_key: "species_id"
end
