class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :sold_quantity_increment
  def sold_quantity_increment
    prev_sales = self.product.sold_quantity
    this_quantity = self.quantity
    new_sales = prev_sales + this_quantity
    self.product.update(sold_quantity: new_sales)
  end
end
