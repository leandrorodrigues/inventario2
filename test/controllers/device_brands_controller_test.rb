require 'test_helper'

class DeviceBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_brand = device_brands(:one)
  end

  test "should get index" do
    get device_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_device_brand_url
    assert_response :success
  end

  test "should create device_brand" do
    assert_difference('DeviceBrand.count') do
      post device_brands_url, params: { device_brand: { title: @device_brand.title } }
    end

    assert_redirected_to device_brand_url(DeviceBrand.last)
  end

  test "should show device_brand" do
    get device_brand_url(@device_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_brand_url(@device_brand)
    assert_response :success
  end

  test "should update device_brand" do
    patch device_brand_url(@device_brand), params: { device_brand: { title: @device_brand.title } }
    assert_redirected_to device_brand_url(@device_brand)
  end

  test "should destroy device_brand" do
    assert_difference('DeviceBrand.count', -1) do
      delete device_brand_url(@device_brand)
    end

    assert_redirected_to device_brands_url
  end
end
