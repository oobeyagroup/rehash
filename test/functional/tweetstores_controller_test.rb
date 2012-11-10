require 'test_helper'

class TweetstoresControllerTest < ActionController::TestCase
  setup do
    @tweetstore = tweetstores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweetstores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweetstore" do
    assert_difference('Tweetstore.count') do
      post :create, tweetstore: { name: @tweetstore.name, profile_image_url: @tweetstore.profile_image_url, screen_name: @tweetstore.screen_name, text: @tweetstore.text, tweeted_at: @tweetstore.tweeted_at }
    end

    assert_redirected_to tweetstore_path(assigns(:tweetstore))
  end

  test "should show tweetstore" do
    get :show, id: @tweetstore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweetstore
    assert_response :success
  end

  test "should update tweetstore" do
    put :update, id: @tweetstore, tweetstore: { name: @tweetstore.name, profile_image_url: @tweetstore.profile_image_url, screen_name: @tweetstore.screen_name, text: @tweetstore.text, tweeted_at: @tweetstore.tweeted_at }
    assert_redirected_to tweetstore_path(assigns(:tweetstore))
  end

  test "should destroy tweetstore" do
    assert_difference('Tweetstore.count', -1) do
      delete :destroy, id: @tweetstore
    end

    assert_redirected_to tweetstores_path
  end
end
