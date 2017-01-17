require 'test_helper'

class EmprestimoHabilidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprestimo_habilidade = emprestimo_habilidades(:one)
  end

  test "should get index" do
    get emprestimo_habilidades_url
    assert_response :success
  end

  test "should get new" do
    get new_emprestimo_habilidade_url
    assert_response :success
  end

  test "should create emprestimo_habilidade" do
    assert_difference('EmprestimoHabilidade.count') do
      post emprestimo_habilidades_url, params: { emprestimo_habilidade: { habilidade_id: @emprestimo_habilidade.habilidade_id, usuario_id: @emprestimo_habilidade.usuario_id } }
    end

    assert_redirected_to emprestimo_habilidade_url(EmprestimoHabilidade.last)
  end

  test "should show emprestimo_habilidade" do
    get emprestimo_habilidade_url(@emprestimo_habilidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_emprestimo_habilidade_url(@emprestimo_habilidade)
    assert_response :success
  end

  test "should update emprestimo_habilidade" do
    patch emprestimo_habilidade_url(@emprestimo_habilidade), params: { emprestimo_habilidade: { habilidade_id: @emprestimo_habilidade.habilidade_id, usuario_id: @emprestimo_habilidade.usuario_id } }
    assert_redirected_to emprestimo_habilidade_url(@emprestimo_habilidade)
  end

  test "should destroy emprestimo_habilidade" do
    assert_difference('EmprestimoHabilidade.count', -1) do
      delete emprestimo_habilidade_url(@emprestimo_habilidade)
    end

    assert_redirected_to emprestimo_habilidades_url
  end
end
