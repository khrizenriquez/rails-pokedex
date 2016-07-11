class Pokemon < ApplicationRecord
	self.primary_key = 'id'

	has_many :pokemon_asset
end
