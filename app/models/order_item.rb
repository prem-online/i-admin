class OrderItem < ApplicationRecord
  belongs_to :order, foreign_key: 'order_id', primary_key: 'order_number'
end
