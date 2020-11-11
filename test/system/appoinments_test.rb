require "application_system_test_case"

class AppoinmentsTest < ApplicationSystemTestCase
  setup do
    @appoinment = appoinments(:one)
  end

  test "visiting the index" do
    visit appoinments_url
    assert_selector "h1", text: "Appoinments"
  end

  test "creating a Appoinment" do
    visit appoinments_url
    click_on "New Appoinment"

    fill_in "Day", with: @appoinment.day
    fill_in "Service", with: @appoinment.service_id
    fill_in "User", with: @appoinment.user_id
    click_on "Create Appoinment"

    assert_text "Appoinment was successfully created"
    click_on "Back"
  end

  test "updating a Appoinment" do
    visit appoinments_url
    click_on "Edit", match: :first

    fill_in "Day", with: @appoinment.day
    fill_in "Service", with: @appoinment.service_id
    fill_in "User", with: @appoinment.user_id
    click_on "Update Appoinment"

    assert_text "Appoinment was successfully updated"
    click_on "Back"
  end

  test "destroying a Appoinment" do
    visit appoinments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appoinment was successfully destroyed"
  end
end
