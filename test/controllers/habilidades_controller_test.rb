require 'test_helper'

class HabilidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habilidade = habilidades(:one)
  end

  test "should get index" do
    get habilidades_url
    assert_response :success
  end

  test "should get new" do
    get new_habilidade_url
    assert_response :success
  end

  test "should create habilidade" do
    assert_difference('Habilidade.count') do
      post habilidades_url, params: { habilidade: { categoria: @habilidade.categoria, descricao: @habilidade.descricao, nome: @habilidade.nome } }
    end

    assert_redirected_to habilidade_url(Habilidade.last)
  end

  test "should show habilidade" do
    get habilidade_url(@habilidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_habilidade_url(@habilidade)
    assert_response :success
  end

  test "should update habilidade" do
    patch habilidade_url(@habilidade), params: { habilidade: { categoria: @habilidade.categoria, descricao: @habilidade.descricao, nome: @habilidade.nome } }
    assert_redirected_to habilidade_url(@habilidade)
  end

  test "should destroy habilidade" do
    assert_difference('Habilidade.count', -1) do
      delete habilidade_url(@habilidade)
    end

    assert_redirected_to habilidades_url
  end
end
