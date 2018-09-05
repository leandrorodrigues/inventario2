require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Allocation", with: @item.allocation
    fill_in "Brand Name", with: @item.brand_name
    fill_in "Model Description", with: @item.model_description
    fill_in "Net Value", with: @item.net_value
    fill_in "Number", with: @item.number
    fill_in "Serial Number", with: @item.serial_number
    fill_in "Title", with: @item.title
    fill_in "Value", with: @item.value
    fill_in "Warranty Date", with: @item.warranty_date
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Allocation", with: @item.allocation
    fill_in "Brand Name", with: @item.brand_name
    fill_in "Model Description", with: @item.model_description
    fill_in "Net Value", with: @item.net_value
    fill_in "Number", with: @item.number
    fill_in "Serial Number", with: @item.serial_number
    fill_in "Title", with: @item.title
    fill_in "Value", with: @item.value
    fill_in "Warranty Date", with: @item.warranty_date
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
