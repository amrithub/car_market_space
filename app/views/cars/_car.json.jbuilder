json.extract! car, :id, :date_posted, :model, :kilometres, :last_edited, :year_manufactured, :make, :body_type, :transmission, :air_conditioning, :colour, :created_at, :updated_at
json.url car_url(car, format: :json)
