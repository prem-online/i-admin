class AddSoldQuantityToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sold_quantity, :integer, default: 0, null: false
  end
end
