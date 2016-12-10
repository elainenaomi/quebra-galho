require 'test_helper'

class FerramentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ferramentum = ferramenta(:one)
  end

  test "should get index" do
    get ferramenta_url
    assert_response :success
  end

  test "should get new" do
    get new_ferramentum_url
    assert_response :success
  end

  test "should create ferramentum" do
    assert_difference('Ferramentum.count') do
      post ferramenta_url, params: { ferramentum: { descricao: @ferramentum.descricao, disponibilidade: @ferramentum.disponibilidade, nome: @ferramentum.nome } }
    end

    assert_redirected_to ferramentum_url(Ferramentum.last)
  end

  test "should show ferramentum" do
    get ferramentum_url(@ferramentum)
    assert_response :success
  end

  test "should get edit" do
    get edit_ferramentum_url(@ferramentum)
    assert_response :success
  end

  test "should update ferramentum" do
    patch ferramentum_url(@ferramentum), params: { ferramentum: { descricao: @ferramentum.descricao, disponibilidade: @ferramentum.disponibilidade, nome: @ferramentum.nome } }
    assert_redirected_to ferramentum_url(@ferramentum)
  end

  test "should destroy ferramentum" do
    assert_difference('Ferramentum.count', -1) do
      delete ferramentum_url(@ferramentum)
    end

    assert_redirected_to ferramenta_url
  end
end
