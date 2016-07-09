class API::V1::PokemonsController < ApplicationController

	def index
		language 	= 9
		p = Pokemon.all.select("pokemons.id, pokemon_species_names.name")
					.joins(:pokemon_species_name)
					.where("pokemon_species_names.local_language_id = #{language}")
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end

	def show
		pokemon_id 	= params[:id]
		language 	= 9
		p = Pokemon.all.select("pokemons.id, pokemon_species_names.name")
					.joins(:pokemon_species_name)
					.where("pokemon_species_names.local_language_id = #{language}")
					.where("pokemons.id = #{pokemon_id}").first
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end
end
