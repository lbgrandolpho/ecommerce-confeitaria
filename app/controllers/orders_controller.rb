class OrdersController < ApplicationController
  def new
    @order = Order.new
    flavor_ids = params[:flavor_ids] || []
    flavor_ids.each do |flavor_id|
      @order.order_items.build(flavor_id: flavor_id)
    end
  end

  def create
    Rails.logger.info "Order Params: #{order_params.inspect}"
    @order = Order.new(order_params)

    @order.order_items.each { |item| item.order = @order }

    if @order.save
      redirect_to @order, notice: "Pedido foi criado com sucesso."
    else
      Rails.logger.info "Order Errors: #{@order.errors.full_messages.join(", ")}"
      @order.order_items.each do |item|
        Rails.logger.info "OrderItem Errors: #{item.errors.full_messages.join(", ")}"
      end
      flash[:alert] = @order.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:address, order_items_attributes: [ :id, :flavor_id, :weight, :_destroy ])
  end
end
