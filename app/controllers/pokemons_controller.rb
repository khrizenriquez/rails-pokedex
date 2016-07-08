class PokemonsController < ApplicationController
# 	SELECT pokemons.id, pokemon_species_names.name FROM pokemons 
# inner join pokemon_species_names on pokemon_species_names.pokemon_species_id = pokemons.species_id
# where pokemon_species_names.local_language_id = 9
	def index
		pokemons 	= Pokemon.all
		language 	= 9
		@p = pokemons.select("pokemons.id, pokemon_species_names.name")
					.joins(:pokemon_species_name)
					.where("pokemon_species_names.local_language_id = #{language}")
		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @p }
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
		  format.html # show.html.erb
		  format.json { render json: p }

		end
	end
end
