class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  before_validation :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def find_existed_product(item_params)
    order_items.find { |item| item.product_id.to_s == item_params[:product_id] }
  end

private
  def set_order_status
    self.order_status_id = 1 if self.order_status_id.nil?
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
