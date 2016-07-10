class API::V1::PokemonAssetsController < ApplicationController

  #only call once
  def fill_data_cries 
    base = Dir[Rails.application.config.assets_base_path.join('pokemons-cries', '*')]

    tmp = []
    base.each do |element|
      pokemon_id = element.scan(/\d+/)[1] 
      if pokemon_id != nil
        tmp << {:pokemon_id => pokemon_id, :type_id => 2}
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_ico 
    base = Dir[Rails.application.config.assets_base_path.join('pokemons-ico', 'overworld', '*')]

    tmp = []
    base.each do |element|
      pokemon_id = element.scan(/\d+/)[1] 
      if pokemon_id != nil
        tmp << {:pokemon_id => pokemon_id, :type_id => 1}
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_svg 
    base = Dir[Rails.application.config.assets_base_path.join('pokemons-svg', '*')]

    tmp = []
    base.each do |element|
      pokemon_id = element.scan(/\d+/)[1] 
      if pokemon_id != nil
        tmp << {:pokemon_id => pokemon_id, :type_id => 3}
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_img 
    base = Dir[Rails.application.config.assets_base_path.join('pokemons-art-sugimori', '*')]

    tmp = []
    base.each do |element|
      pokemon_id = element.scan(/\d+/)[1] 
      if pokemon_id != nil
        tmp << {:pokemon_id => pokemon_id, :type_id => 4}
      end
    end

    PokemonAsset.create(tmp)
  end
end
