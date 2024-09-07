ActiveAdmin.register Order do
  permit_params :order_number, :total

  index do
    selectable_column
    id_column
    column :order_number
    column :total
    column :created_at do |obj|
      obj.created_at.in_time_zone(current_admin_user.timezone)
    end
    column :updated_at do |obj|
      obj.updated_at.in_time_zone(current_admin_user.timezone)
    end
    actions
  end

  filter :order_number
  filter :total
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :order_number
      f.input :total
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :order_number
      row :total
      row :created_at do |obj|
        obj.created_at.in_time_zone(current_admin_user.timezone)
      end
      row :updated_at do |obj|
        obj.updated_at.in_time_zone(current_admin_user.timezone)
      end
    end

    panel 'Items' do
      table_for order.order_items do
        column :id
        column 'Name' do |obj|
          obj.product.name
        end
        column 'Image' do |obj|
          image_tag obj.product.image.variant(:micro), class: 'thumbnail_image'
        end
        column :quantity
        column :sub_total
      end
    end

  end
end
