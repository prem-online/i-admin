class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :total, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
