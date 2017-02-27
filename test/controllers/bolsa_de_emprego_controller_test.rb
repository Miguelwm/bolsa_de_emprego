require 'test_helper'

class BolsaDeEmpregoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bolsa_de_emprego_home_url
    assert_response :success
  end

  test "should get entidades" do
    get bolsa_de_emprego_entidades_url
    assert_response :success
  end

  test "should get candidatos" do
    get bolsa_de_emprego_candidatos_url
    assert_response :success
  end

  test "should get ofertas" do
    get bolsa_de_emprego_ofertas_url
    assert_response :success
  end

  test "should get noticias" do
    get bolsa_de_emprego_noticias_url
    assert_response :success
  end

end
