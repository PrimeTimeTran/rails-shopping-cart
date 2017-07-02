class OrderItemsController < ApplicationController
  def create
    @order = current_order
    product = @order.order_items.where(product_id: order_item_params[:product_id]).first
    if product.nil?
      @order.order_items.create(order_item_params)
    else
      product = @order.find_existed_product(order_item_params)
      @order.order_items.where(product_id: product.product_id).first.update_attributes(quantity: product.quantity + order_item_params[:quantity].to_i)
      @order.save
    end
    redirect_back(fallback_location: products_path)
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_back(fallback_location: cart_path)
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_back(fallback_location: cart_path)
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
