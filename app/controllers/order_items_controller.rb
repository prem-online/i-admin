class OrderItemsController < InheritedResources::Base

  private

    def order_item_params
      params.require(:order_item).permit(:product_id_id, :quantity, :sub_total)
    end

end
