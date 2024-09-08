ActiveAdmin.register Category do
  permit_params :name
  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at do |obj|
      obj.created_at.in_time_zone(current_admin_user.timezone)
    end
    column :updated_at do |obj|
      obj.updated_at.in_time_zone(current_admin_user.timezone)
    end
    actions
  end
end