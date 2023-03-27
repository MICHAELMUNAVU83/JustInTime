require "application_system_test_case"

class DonationsTest < ApplicationSystemTestCase
  setup { @donation = donations(:one) }

  test "visiting the index" do
    visit donations_url
    assert_selector "h1", text: "Donations"
  end

  test "should create donation" do
    visit donations_url
    click_on "New donation"

    fill_in "Drop off point", with: @donation.drop_off_point
    fill_in "Nature", with: @donation.nature
    fill_in "Type of donation", with: @donation.type_of_donation
    fill_in "User", with: @donation.user_id
    fill_in "Weight", with: @donation.weight
    click_on "Create Donation"

    assert_text "Donation was successfully created"
    click_on "Back"
  end

  test "should update Donation" do
    visit donation_url(@donation)
    click_on "Edit this donation", match: :first

    fill_in "Drop off point", with: @donation.drop_off_point
    fill_in "Nature", with: @donation.nature
    fill_in "Type of donation", with: @donation.type_of_donation
    fill_in "User", with: @donation.user_id
    fill_in "Weight", with: @donation.weight
    click_on "Update Donation"

    assert_text "Donation was successfully updated"
    click_on "Back"
  end

  test "should destroy Donation" do
    visit donation_url(@donation)
    click_on "Destroy this donation", match: :first

    assert_text "Donation was successfully destroyed"
  end
end
