class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: 1)
    @list = Array.new
    @addresses.each { |a|
      @string = "〒#{a.postal_code} #{a.address} #{a.name}"
      @list.append([@string, a.id])
    }
  end

  def index
  end

  def show
  end

  def confirm
    @confirm = Order.new(order_params)
    if @confirm.status == 1
      logger.debug("ご自身の住所")
      @confirm.postal_code = Customer.find(1).postal_code
      @confirm.address = Customer.find(1).address
      @confirm.name = Customer.find(1).family_name+Customer.find(1).first_name
    elsif @confirm.status == 2
      logger.debug("登録済み住所から選択")
      @confirm.postal_code = Address.find(@confirm.postage).postal_code
      @confirm.address = Address.find(@confirm.postage).address
      @confirm.name = Address.find(@confirm.postage).name
    elsif @confirm.status == 3
      logger.debug("新しいお届け先")
    end
    @confirm.postage = 1000
    @cart_items = CartItem.where(customer_id: 1)
    @price_without_postage = @cart_items.sum { |ci| ci.item.total_payment*ci[:quantity] }
    @confirm.price = @price_without_postage + @confirm.postage
    @confirm.customer_id = 1
    logger.debug(@confirm.inspect)
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :postal_code, :address, :name, :postage, :price, :payment_method)
  end
end
