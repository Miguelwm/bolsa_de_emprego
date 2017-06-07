require 'test_helper'

class NoticiasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get noticias_new_url
    assert_response :success
  end

  test "should get edit" do
    get noticias_edit_url
    assert_response :success
  end

end
