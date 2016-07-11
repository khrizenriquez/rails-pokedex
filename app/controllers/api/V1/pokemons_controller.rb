class API::V1::PokemonsController < ApplicationController

	def index
		p = Pokemon.all
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end

	def show
		poke_param 	= params[:id]

		if poke_param == nil
			poke_param = 1
		end

		p = Pokemon.select("pokemons.nat, pokemons.name, pokemons.hp, pokemons.atk, 
							pokemons.def, 
							group_concat(pokemon_assets.slug) slug")
			.joins(:pokemon_asset)
			.where(nat: poke_param)
			.first

		r = Hash.new
		r[:pokedex_national] 	= p.nat
		r[:name] 		= p.name
		r[:hp] 			= p.hp
		r[:atk] 		= p.atk
		r[:def] 		= p.def
		r[:assets] 		= {}

		ico 	= []
		svg 	= []
		png 	= []
		sound 	= []
		p.slug.split(',').each do |element| 
			if element.index('pokemons-ico')
				ico.push(element)
			end
			if element.index('pokemons-svg')
				svg.push(element)
			end
			if element.index('pokemons-art-sugimori')
				png.push(element)
			end
			if element.index('pokemons-cries')
				sound.push(element)
			end
		end

		r[:assets][:ico] 	= ico
		r[:assets][:sounds] = sound
		r[:assets][:svg] 	= svg
		r[:assets][:png] 	= png

		# Adding sound position
		respond_to do |format|
		  format.html
		  format.json { render json: r }
		end
	end

	def fill_detail_type_pokemon
		assets = PokemonAssetsController.new
		assets.fill_data_ico
		assets.fill_data_cries
		assets.fill_data_svg
		assets.fill_data_img
	end

	# http://stackoverflow.com/questions/24980295/strictly-convert-string-to-integer-or-nil
	def number_or_nil (string)
		num = string.to_i
  		num if num.to_s == string
	end
end
