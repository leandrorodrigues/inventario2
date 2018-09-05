require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { allocation: @item.allocation, brand_name: @item.brand_name, model_description: @item.model_description, net_value: @item.net_value, number: @item.number, serial_number: @item.serial_number, title: @item.title, value: @item.value, warranty_date: @item.warranty_date } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { allocation: @item.allocation, brand_name: @item.brand_name, model_description: @item.model_description, net_value: @item.net_value, number: @item.number, serial_number: @item.serial_number, title: @item.title, value: @item.value, warranty_date: @item.warranty_date } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
