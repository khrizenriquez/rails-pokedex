class API::V1::PokemonsController < ApplicationController

	def index
		p = Pokemon.all
					.select("pokemons.nat, pokemons.name, pokemons.hp, pokemons.atk, 
							pokemons.def, 
							group_concat(pokemon_assets.slug) slug")
					.joins(:pokemon_asset)
					.group("pokemons.id")

		arr = []

		p.each do |element| 
			r = Hash.new
			r["pokedex_national"] 	= element.nat
			r["name"] 		= element.name
			r["hp"] 		= element.hp
			r["atk"] 		= element.atk
			r["def"] 		= element.def
			r["assets"] 	= {}

			ico 	= []
			svg 	= []
			png 	= []
			sound 	= []
			element.slug.split(',').each do |ele| 
				element_path = Pathname.new("#{request.env["HTTP_HOST"]}/#{ele}")
				if ele.index('pokemons-ico')
					ico.push(element_path)
				end
				if ele.index('pokemons-svg')
					svg.push(element_path)
				end
				if ele.index('pokemons-art-sugimori')
					png.push(element_path)
				end
				if ele.index('pokemons-cries')
					sound.push(element_path)
				end
			end

			r["assets"]["ico"] 	= ico
			r["assets"]["sounds"] = sound
			r["assets"]["svg"] 	= svg
			r["assets"]["png"] 	= png

			arr << r
		end

		respond_to do |format|
		  format.html
		  format.json { render json: arr }
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
			.group("pokemons.id")
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
			element_path = Pathname.new("#{request.env["HTTP_HOST"]}/#{element}")
			if element.index('pokemons-ico')
				ico.push(element_path)
			end
			if element.index('pokemons-svg')
				svg.push(element_path)
			end
			if element.index('pokemons-art-sugimori')
				png.push(element_path)
			end
			if element.index('pokemons-cries')
				sound.push(element_path)
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
