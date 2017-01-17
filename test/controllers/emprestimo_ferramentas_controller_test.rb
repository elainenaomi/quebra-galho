require 'test_helper'

class EmprestimoFerramentasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprestimo_ferramenta = emprestimo_ferramentas(:one)
  end

  test "should get index" do
    get emprestimo_ferramentas_url
    assert_response :success
  end

  test "should get new" do
    get new_emprestimo_ferramenta_url
    assert_response :success
  end

  test "should create emprestimo_ferramenta" do
    assert_difference('EmprestimoFerramenta.count') do
      post emprestimo_ferramentas_url, params: { emprestimo_ferramenta: { ferramenta_id: @emprestimo_ferramenta.ferramenta_id, usuario_id: @emprestimo_ferramenta.usuario_id } }
    end

    assert_redirected_to emprestimo_ferramenta_url(EmprestimoFerramenta.last)
  end

  test "should show emprestimo_ferramenta" do
    get emprestimo_ferramenta_url(@emprestimo_ferramenta)
    assert_response :success
  end

  test "should get edit" do
    get edit_emprestimo_ferramenta_url(@emprestimo_ferramenta)
    assert_response :success
  end

  test "should update emprestimo_ferramenta" do
    patch emprestimo_ferramenta_url(@emprestimo_ferramenta), params: { emprestimo_ferramenta: { ferramenta_id: @emprestimo_ferramenta.ferramenta_id, usuario_id: @emprestimo_ferramenta.usuario_id } }
    assert_redirected_to emprestimo_ferramenta_url(@emprestimo_ferramenta)
  end

  test "should destroy emprestimo_ferramenta" do
    assert_difference('EmprestimoFerramenta.count', -1) do
      delete emprestimo_ferramenta_url(@emprestimo_ferramenta)
    end

    assert_redirected_to emprestimo_ferramentas_url
  end
end
