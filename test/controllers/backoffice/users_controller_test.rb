require 'test_helper'

class Backoffice::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_user = backoffice_users(:one)
  end

  test "should get index" do
    get backoffice_users_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_user_url
    assert_response :success
  end

  test "should create backoffice_user" do
    assert_difference('Backoffice::User.count') do
      post backoffice_users_url, params: { backoffice_user: {  } }
    end

    assert_redirected_to backoffice_user_url(Backoffice::User.last)
  end

  test "should show backoffice_user" do
    get backoffice_user_url(@backoffice_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_user_url(@backoffice_user)
    assert_response :success
  end

  test "should update backoffice_user" do
    patch backoffice_user_url(@backoffice_user), params: { backoffice_user: {  } }
    assert_redirected_to backoffice_user_url(@backoffice_user)
  end

  test "should destroy backoffice_user" do
    assert_difference('Backoffice::User.count', -1) do
      delete backoffice_user_url(@backoffice_user)
    end

    assert_redirected_to backoffice_users_url
  end
end
