class API::V1::PokemonAssetsController < ApplicationController

  #only call once
  def fill_data_cries 
    file_name = 'pokemons-cries'
    base      = Dir[Rails.application.config.assets_base_path.join(file_name, '*')]
    relative  = Rails.application.config.assets_relative_path.join(file_name)

    tmp = []
    base.each do |element|
      pokemon_id    = element.scan(/\d+/)[1] 
      element_name  = element.split('/').last

      if pokemon_id != nil
        # /media/pokemons/v1/:file_name/:element_name
        tmp << {
                :pokemon_id => pokemon_id, 
                :type_id    => 2, 
                :slug       => relative.join(element_name)
        }
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_ico 
    file_name = 'pokemons-ico'
    base      = Dir[Rails.application.config.assets_base_path.join(file_name, 'overworld', 'down', '*')]
    relative  = Rails.application.config.assets_relative_path.join(file_name, 'overworld', 'down')

    tmp = []
    base.each do |element|
      pokemon_id    = element.scan(/\d+/)[1] 
      element_name  = element.split('/').last
      if pokemon_id != nil
        tmp << {
                :pokemon_id => pokemon_id, 
                :type_id    => 1, 
                :slug       => relative.join(element_name)
        }
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_svg 
    file_name = 'pokemons-svg'
    base      = Dir[Rails.application.config.assets_base_path.join(file_name, '*')]
    relative  = Rails.application.config.assets_relative_path.join(file_name)

    tmp = []
    base.each do |element|
      pokemon_id    = element.scan(/\d+/)[1] 
      element_name  = element.split('/').last
      if pokemon_id != nil
        tmp << {
                :pokemon_id => pokemon_id, 
                :type_id    => 3, 
                :slug       => relative.join(element_name)
        }
      end
    end

    PokemonAsset.create(tmp)
  end

  #only call once
  def fill_data_img 
    file_name = 'pokemons-art-sugimori'
    base      = Dir[Rails.application.config.assets_base_path.join(file_name, '*')]
    relative  = Rails.application.config.assets_relative_path.join(file_name)

    tmp = []
    base.each do |element|
      pokemon_id    = element.scan(/\d+/)[1] 
      element_name  = element.split('/').last
      if pokemon_id != nil
        tmp << {
                :pokemon_id => pokemon_id, 
                :type_id    => 4, 
                :slug       => relative.join(element_name)
        }
      end
    end

    PokemonAsset.create(tmp)
  end
end
