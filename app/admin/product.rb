ActiveAdmin.register Product do
  permit_params :name, :price, :image

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :created_at
    column :updated_at
    column :image do |product|
      if product.image.attached?
        image_tag url_for(product.image), size: '100x100'
      else
        'No Image'
      end
    end
    actions
  end

  filter :name
  filter :price
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :created_at
      row :updated_at
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), size: '300x300'
        else
          'No Image'
        end
      end
    end
  end
end
