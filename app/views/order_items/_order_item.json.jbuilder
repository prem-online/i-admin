json.extract! order_item, :id, :product_id_id, :quantity, :sub_total, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
