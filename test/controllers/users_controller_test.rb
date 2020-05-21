require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users( :one)
    @other_usee = users( :two)
    # login_as(@user, :scope => :user)
  end

  #login時_user一覧
  test "should get index login" do
    login_as(@user, :scope => :user)
    get users_index_url
    assert_response :success

    get "/users/#{@user.id}"
    assert_response :success

    @likes = likes(:one,:two)
    get "/users/#{@user.id}/like"
    assert_response :success
  end

  #logout時_user一覧
  test "should get index logout" do
    get users_index_url
    assert_redirected_to user_session_path

    get "/users/#{@user.id}"
    assert_redirected_to user_session_path

    @likes = likes(:one,:two)
    get "/users/#{@user.id}/like"
    assert_redirected_to user_session_path
  end

  #login_user_edit
  test "should get edit login" do
    login_as(@user, :scope => :user)
    get edit_user_registration_path( :one)
    assert_response :success
  end

end
