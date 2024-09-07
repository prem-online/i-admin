json.extract! order, :id, :order_number, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
