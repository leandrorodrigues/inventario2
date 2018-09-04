require "application_system_test_case"

class ContainerTypesTest < ApplicationSystemTestCase
  setup do
    @container_type = container_types(:one)
  end

  test "visiting the index" do
    visit container_types_url
    assert_selector "h1", text: "Container Types"
  end

  test "creating a Container type" do
    visit container_types_url
    click_on "New Container Type"

    fill_in "Nested", with: @container_type.nested
    fill_in "Slots", with: @container_type.slots
    fill_in "Title", with: @container_type.title
    click_on "Create Container type"

    assert_text "Container type was successfully created"
    click_on "Back"
  end

  test "updating a Container type" do
    visit container_types_url
    click_on "Edit", match: :first

    fill_in "Nested", with: @container_type.nested
    fill_in "Slots", with: @container_type.slots
    fill_in "Title", with: @container_type.title
    click_on "Update Container type"

    assert_text "Container type was successfully updated"
    click_on "Back"
  end

  test "destroying a Container type" do
    visit container_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Container type was successfully destroyed"
  end
end
