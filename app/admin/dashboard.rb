# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Orders" do
          @orders = Order.includes(:order_items).last(10)
          render partial: 'recent_orders', locals: { orders: @orders}
        end
      end

      column do
        panel "Best Sellers" do
          @products = Product.order(sold_quantity: :desc).first(10)
          render partial: 'best_sellers', locals: { products: @products}
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
