class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id].nil?
      current_order = Order.create!
      session[:order_id] = current_order.id
      current_order
    else
      current_order = Order.find(session[:order_id])
    end
  end
end
