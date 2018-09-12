require 'test_helper'

class IntegrantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @integrant = integrants(:one)
  end

  test "should get index" do
    get integrants_url
    assert_response :success
  end

  test "should get new" do
    get new_integrant_url
    assert_response :success
  end

  test "should create integrant" do
    assert_difference('Integrant.count') do
      post integrants_url, params: { integrant: {  } }
    end

    assert_redirected_to integrant_url(Integrant.last)
  end

  test "should show integrant" do
    get integrant_url(@integrant)
    assert_response :success
  end

  test "should get edit" do
    get edit_integrant_url(@integrant)
    assert_response :success
  end

  test "should update integrant" do
    patch integrant_url(@integrant), params: { integrant: {  } }
    assert_redirected_to integrant_url(@integrant)
  end

  test "should destroy integrant" do
    assert_difference('Integrant.count', -1) do
      delete integrant_url(@integrant)
    end

    assert_redirected_to integrants_url
  end
end
