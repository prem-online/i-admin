class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [90, 90, { crop: :centre }]
    attachable.variant :micro, resize_to_fill: [90,90, { crop: :centre }]
  end
  has_and_belongs_to_many :categories

  has_many :order_items, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name price updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob]
  end
end
