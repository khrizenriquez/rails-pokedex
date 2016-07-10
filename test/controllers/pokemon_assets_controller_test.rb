require 'test_helper'

class PokemonAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_asset = pokemon_assets(:one)
  end

  test "should get index" do
    get pokemon_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_asset_url
    assert_response :success
  end

  test "should create pokemon_asset" do
    assert_difference('PokemonAsset.count') do
      post pokemon_assets_url, params: { pokemon_asset: { pokemon_id: @pokemon_asset.pokemon_id, type_id: @pokemon_asset.type_id } }
    end

    assert_redirected_to pokemon_asset_url(PokemonAsset.last)
  end

  test "should show pokemon_asset" do
    get pokemon_asset_url(@pokemon_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_asset_url(@pokemon_asset)
    assert_response :success
  end

  test "should update pokemon_asset" do
    patch pokemon_asset_url(@pokemon_asset), params: { pokemon_asset: { pokemon_id: @pokemon_asset.pokemon_id, type_id: @pokemon_asset.type_id } }
    assert_redirected_to pokemon_asset_url(@pokemon_asset)
  end

  test "should destroy pokemon_asset" do
    assert_difference('PokemonAsset.count', -1) do
      delete pokemon_asset_url(@pokemon_asset)
    end

    assert_redirected_to pokemon_assets_url
  end
end
