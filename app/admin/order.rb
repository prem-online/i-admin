ActiveAdmin.register Order do
  permit_params :order_number, :total

  index do
    selectable_column
    id_column
    column :order_number
    column :total
    column :created_at
    column :updated_at
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
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
