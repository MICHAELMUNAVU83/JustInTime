json.extract! donation, :id, :type_of_donation, :weight, :nature, :drop_off_point, :user_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
