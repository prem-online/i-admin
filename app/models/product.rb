class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [100, 100]
    attachable.variant :large, resize_to_fill: [100, 100]
  end


  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name price updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob]
  end
end
