json.extract! product, :id, :name, :p_type, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
