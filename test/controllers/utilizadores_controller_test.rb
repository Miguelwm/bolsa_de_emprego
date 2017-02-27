require 'test_helper'

class UtilizadorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get urilizador_new_url
    assert_response :success
  end

end
