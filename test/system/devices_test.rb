require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "creating a Device" do
    visit devices_url
    click_on "New Device"

    fill_in "Description", with: @device.description
    fill_in "Device Model", with: @device.device_model_id
    fill_in "Host", with: @device.host
    fill_in "Ip", with: @device.ip
    fill_in "Item", with: @device.item_id
    fill_in "Title", with: @device.title
    fill_in "Unknown", with: @device.unknown
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "updating a Device" do
    visit devices_url
    click_on "Edit", match: :first

    fill_in "Description", with: @device.description
    fill_in "Device Model", with: @device.device_model_id
    fill_in "Host", with: @device.host
    fill_in "Ip", with: @device.ip
    fill_in "Item", with: @device.item_id
    fill_in "Title", with: @device.title
    fill_in "Unknown", with: @device.unknown
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "destroying a Device" do
    visit devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device was successfully destroyed"
  end
end
