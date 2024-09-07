class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true

  before_create :generate_order_number, if: -> { order_number.blank? }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id order_number total updated_at]
  end

  private

  def generate_order_number
    self.order_number = format('ON%05d', (Order.maximum(:id).to_i + 1))
  end
end
