class AddTimezoneToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :timezone, :string
  end
end
