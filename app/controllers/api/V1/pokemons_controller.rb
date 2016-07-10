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

		p = Pokemon.where(nat: poke_param).first

		# Adding images positions
		#item <<{ :status => "Success" }

		#p << { :png_image => "png" }
		#p << { :ico_image => "ico" }

		# Adding sound position
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end

	def fill_detail_type_pokemon
		assets = PokemonAssetsController.new
		#assets.fill_data_ico
		#assets.fill_data_cries
		#assets.fill_data_svg
		#assets.fill_data_img
	end

	# http://stackoverflow.com/questions/24980295/strictly-convert-string-to-integer-or-nil
	def number_or_nil (string)
		num = string.to_i
  		num if num.to_s == string
	end
end
