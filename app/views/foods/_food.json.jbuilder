json.extract! food, :id, :Name, :string, :Measurement-unit, :string, :price, :Quantity, :user_id, :created_at, :updated_at
json.url food_url(food, format: :json)
