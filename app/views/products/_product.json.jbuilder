json.extract! product, :id, :name, :description, :img, :typeInt, :created_at, :updated_at
json.url product_url(product, format: :json)
