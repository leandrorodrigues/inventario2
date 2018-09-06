require "application_system_test_case"

class StockItemsTest < ApplicationSystemTestCase
  setup do
    @stock_item = stock_items(:one)
  end

  test "visiting the index" do
    visit stock_items_url
    assert_selector "h1", text: "Stock Items"
  end

  test "creating a Stock item" do
    visit stock_items_url
    click_on "New Stock Item"

    fill_in "Is Package", with: @stock_item.is_package
    fill_in "Item", with: @stock_item.item_id
    fill_in "Package Quantity", with: @stock_item.package_quantity
    fill_in "Quantity", with: @stock_item.quantity
    fill_in "Title", with: @stock_item.title
    click_on "Create Stock item"

    assert_text "Stock item was successfully created"
    click_on "Back"
  end

  test "updating a Stock item" do
    visit stock_items_url
    click_on "Edit", match: :first

    fill_in "Is Package", with: @stock_item.is_package
    fill_in "Item", with: @stock_item.item_id
    fill_in "Package Quantity", with: @stock_item.package_quantity
    fill_in "Quantity", with: @stock_item.quantity
    fill_in "Title", with: @stock_item.title
    click_on "Update Stock item"

    assert_text "Stock item was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock item" do
    visit stock_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock item was successfully destroyed"
  end
end
