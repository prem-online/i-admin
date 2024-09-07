class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:order_number, :total)
    end

end
