require "application_system_test_case"

class DeviceModelsTest < ApplicationSystemTestCase
  setup do
    @device_model = device_models(:one)
  end

  test "visiting the index" do
    visit device_models_url
    assert_selector "h1", text: "Device Models"
  end

  test "creating a Device model" do
    visit device_models_url
    click_on "New Device Model"

    fill_in "Device Brand", with: @device_model.device_brand_id
    fill_in "Device Type", with: @device_model.device_type_id
    fill_in "Ethernet Interfaces", with: @device_model.ethernet_interfaces
    fill_in "Fiber Interfaces", with: @device_model.fiber_interfaces
    fill_in "Rack Units", with: @device_model.rack_units
    fill_in "Stock Unit", with: @device_model.stock_unit
    fill_in "Title", with: @device_model.title
    click_on "Create Device model"

    assert_text "Device model was successfully created"
    click_on "Back"
  end

  test "updating a Device model" do
    visit device_models_url
    click_on "Edit", match: :first

    fill_in "Device Brand", with: @device_model.device_brand_id
    fill_in "Device Type", with: @device_model.device_type_id
    fill_in "Ethernet Interfaces", with: @device_model.ethernet_interfaces
    fill_in "Fiber Interfaces", with: @device_model.fiber_interfaces
    fill_in "Rack Units", with: @device_model.rack_units
    fill_in "Stock Unit", with: @device_model.stock_unit
    fill_in "Title", with: @device_model.title
    click_on "Update Device model"

    assert_text "Device model was successfully updated"
    click_on "Back"
  end

  test "destroying a Device model" do
    visit device_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device model was successfully destroyed"
  end
end
