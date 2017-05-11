require 'test_helper'

class ReleaseMainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release_main = release_mains(:one)
  end

  test "should get index" do
    get release_mains_url
    assert_response :success
  end

  test "should get new" do
    get new_release_main_url
    assert_response :success
  end

  test "should create release_main" do
    assert_difference('ReleaseMain.count') do
      post release_mains_url, params: { release_main: {  } }
    end

    assert_redirected_to release_main_url(ReleaseMain.last)
  end

  test "should show release_main" do
    get release_main_url(@release_main)
    assert_response :success
  end

  test "should get edit" do
    get edit_release_main_url(@release_main)
    assert_response :success
  end

  test "should update release_main" do
    patch release_main_url(@release_main), params: { release_main: {  } }
    assert_redirected_to release_main_url(@release_main)
  end

  test "should destroy release_main" do
    assert_difference('ReleaseMain.count', -1) do
      delete release_main_url(@release_main)
    end

    assert_redirected_to release_mains_url
  end
end
