require 'test_helper'

class ContainerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @container_type = container_types(:one)
  end

  test "should get index" do
    get container_types_url
    assert_response :success
  end

  test "should get new" do
    get new_container_type_url
    assert_response :success
  end

  test "should create container_type" do
    assert_difference('ContainerType.count') do
      post container_types_url, params: { container_type: { nested: @container_type.nested, slots: @container_type.slots, title: @container_type.title } }
    end

    assert_redirected_to container_type_url(ContainerType.last)
  end

  test "should show container_type" do
    get container_type_url(@container_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_container_type_url(@container_type)
    assert_response :success
  end

  test "should update container_type" do
    patch container_type_url(@container_type), params: { container_type: { nested: @container_type.nested, slots: @container_type.slots, title: @container_type.title } }
    assert_redirected_to container_type_url(@container_type)
  end

  test "should destroy container_type" do
    assert_difference('ContainerType.count', -1) do
      delete container_type_url(@container_type)
    end

    assert_redirected_to container_types_url
  end
end
