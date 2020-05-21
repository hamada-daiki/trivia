require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers #追加
  # test "the truth" do
  #   assert true
  # end
  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  # new_post_view(login時)
  test "should get new login" do
    login_as(@user, :scope => :user)
    get new_post_url
    assert_response :success
  end
  # new_post_view(logout時)
  test "should get new logout" do
    get new_post_url
    assert_response :redirect
  end

  # create_post_view(login時)
  test "should post create login" do
    login_as(@user, :scope => :user)
    post posts_url, params:{
      body: "sample_body",
      img: "sample_img.jpg",
      category: "sample_categroy"
    }
    # assert_response :redirect
    assert_redirected_to posts_path
  end
  # create_post_view(logout時)
  test "should post create logout" do
    post posts_url, params:{
      body: "sample_body",
      img: "sample_img.jpg",
      category: "sample_categroy"
    }
    assert_redirected_to user_session_path 
  end
end
