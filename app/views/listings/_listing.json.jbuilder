json.extract! listing, :id, :name, :rating, :description, :short_description, :location, :price, :duration, :capacity, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
