ActiveAdmin.register Product do
  permit_params :name, :price, :image, category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :categories do |product|
      product.categories.map(&:name).join(', ')
    end
    column :created_at do |obj|
      obj.created_at.in_time_zone(current_admin_user.timezone)
    end
    column :updated_at do |obj|
      obj.updated_at.in_time_zone(current_admin_user.timezone)
    end
    column :image do |product|
      if product.image.attached?
        image_tag product.image.variant(:thumb), size: '100x100'
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

  controller do
    def scoped_collection
      Product.includes(:categories)
    end
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :image, as: :file, html_input: {id: "product-img-input"}, hint: f.object.image.present? ? image_tag(f.object.image.variant(:thumb), id: 'product-img-preview', style: 'max-width: 300px;') : content_tag(:span, "No image yet")
      f.input :categories, as: :searchable_select, collection: Category.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :created_at do |obj|
        obj.created_at.in_time_zone(current_admin_user.timezone)
      end
      row :updated_at do |obj|
        obj.updated_at.in_time_zone(current_admin_user.timezone)
      end
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), class: 'thumbnail_image'
        else
          'No Image'
        end
      end
    end
  end
end
