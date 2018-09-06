require "application_system_test_case"

class ContainersTest < ApplicationSystemTestCase
  setup do
    @container = containers(:one)
  end

  test "visiting the index" do
    visit containers_url
    assert_selector "h1", text: "Containers"
  end

  test "creating a Container" do
    visit containers_url
    click_on "New Container"

    fill_in "Container", with: @container.container_id
    fill_in "Container Type", with: @container.container_type_id
    fill_in "Item", with: @container.item_id
    fill_in "Place", with: @container.place_id
    fill_in "Reverse", with: @container.reverse
    fill_in "Title", with: @container.title
    click_on "Create Container"

    assert_text "Container was successfully created"
    click_on "Back"
  end

  test "updating a Container" do
    visit containers_url
    click_on "Edit", match: :first

    fill_in "Container", with: @container.container_id
    fill_in "Container Type", with: @container.container_type_id
    fill_in "Item", with: @container.item_id
    fill_in "Place", with: @container.place_id
    fill_in "Reverse", with: @container.reverse
    fill_in "Title", with: @container.title
    click_on "Update Container"

    assert_text "Container was successfully updated"
    click_on "Back"
  end

  test "destroying a Container" do
    visit containers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Container was successfully destroyed"
  end
end
