class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.build(order_item_params)
    if @order_item.save
      redirect_to @order, notice: "Item adicionado ao pedido com sucesso."
    else
      redirect_to @order, alert: @order_item.errors.full_messages.join(", ")
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, notice: "Item removido do pedido com sucesso."
  end

  private

  def order_item_params
    params.require(:order_item).permit(:flavor_id)
  end
end
