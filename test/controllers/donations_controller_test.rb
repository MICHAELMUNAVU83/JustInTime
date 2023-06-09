require "test_helper"

class DonationsControllerTest < ActionDispatch::IntegrationTest
  setup { @donation = donations(:one) }

  test "should get index" do
    get donations_url
    assert_response :success
  end

  test "should get new" do
    get new_donation_url
    assert_response :success
  end

  test "should create donation" do
    assert_difference("Donation.count") do
      post donations_url,
           params: {
             donation: {
               drop_off_point: @donation.drop_off_point,
               nature: @donation.nature,
               type_of_donation: @donation.type_of_donation,
               user_id: @donation.user_id,
               weight: @donation.weight
             }
           }
    end

    assert_redirected_to donation_url(Donation.last)
  end

  test "should show donation" do
    get donation_url(@donation)
    assert_response :success
  end

  test "should get edit" do
    get edit_donation_url(@donation)
    assert_response :success
  end

  test "should update donation" do
    patch donation_url(@donation),
          params: {
            donation: {
              drop_off_point: @donation.drop_off_point,
              nature: @donation.nature,
              type_of_donation: @donation.type_of_donation,
              user_id: @donation.user_id,
              weight: @donation.weight
            }
          }
    assert_redirected_to donation_url(@donation)
  end

  test "should destroy donation" do
    assert_difference("Donation.count", -1) { delete donation_url(@donation) }

    assert_redirected_to donations_url
  end
end
