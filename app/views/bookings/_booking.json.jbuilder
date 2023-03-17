json.extract! booking, :id, :date, :user_id, :listing_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
