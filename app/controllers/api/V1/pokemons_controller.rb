class API::V1::PokemonsController < ApplicationController

	def index
		p = Pokemon.all
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end

	def show
		poke_param 	= number_or_nil(params[:id])

		if poke_param == nil
			poke_param = 1
		end

		p = Pokemon.find(poke_param)
		respond_to do |format|
		  format.html
		  format.json { render json: p }
		end
	end

	# http://stackoverflow.com/questions/24980295/strictly-convert-string-to-integer-or-nil
	def number_or_nil (string)
		num = string.to_i
  		num if num.to_s == string
	end
end
