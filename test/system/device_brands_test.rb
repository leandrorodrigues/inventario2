require "application_system_test_case"

class DeviceBrandsTest < ApplicationSystemTestCase
  setup do
    @device_brand = device_brands(:one)
  end

  test "visiting the index" do
    visit device_brands_url
    assert_selector "h1", text: "Device Brands"
  end

  test "creating a Device brand" do
    visit device_brands_url
    click_on "New Device Brand"

    fill_in "Title", with: @device_brand.title
    click_on "Create Device brand"

    assert_text "Device brand was successfully created"
    click_on "Back"
  end

  test "updating a Device brand" do
    visit device_brands_url
    click_on "Edit", match: :first

    fill_in "Title", with: @device_brand.title
    click_on "Update Device brand"

    assert_text "Device brand was successfully updated"
    click_on "Back"
  end

  test "destroying a Device brand" do
    visit device_brands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device brand was successfully destroyed"
  end
end
