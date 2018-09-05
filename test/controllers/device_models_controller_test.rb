require 'test_helper'

class DeviceModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_model = device_models(:one)
  end

  test "should get index" do
    get device_models_url
    assert_response :success
  end

  test "should get new" do
    get new_device_model_url
    assert_response :success
  end

  test "should create device_model" do
    assert_difference('DeviceModel.count') do
      post device_models_url, params: { device_model: { device_brand_id: @device_model.device_brand_id, device_type_id: @device_model.device_type_id, ethernet_interfaces: @device_model.ethernet_interfaces, fiber_interfaces: @device_model.fiber_interfaces, rack_units: @device_model.rack_units, stock_unit: @device_model.stock_unit, title: @device_model.title } }
    end

    assert_redirected_to device_model_url(DeviceModel.last)
  end

  test "should show device_model" do
    get device_model_url(@device_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_model_url(@device_model)
    assert_response :success
  end

  test "should update device_model" do
    patch device_model_url(@device_model), params: { device_model: { device_brand_id: @device_model.device_brand_id, device_type_id: @device_model.device_type_id, ethernet_interfaces: @device_model.ethernet_interfaces, fiber_interfaces: @device_model.fiber_interfaces, rack_units: @device_model.rack_units, stock_unit: @device_model.stock_unit, title: @device_model.title } }
    assert_redirected_to device_model_url(@device_model)
  end

  test "should destroy device_model" do
    assert_difference('DeviceModel.count', -1) do
      delete device_model_url(@device_model)
    end

    assert_redirected_to device_models_url
  end
end
