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
    @orders = Order.where(customer_id: 1)
  end

  def create
    @order = Order.new(order_params)
    logger.debug(@order.inspect)
    @order.status = 0
    @order.save
    @cart_items = CartItem.where(customer_id: 1)
    @cart_items.each { |ca|
      @order_detail = OrderDetail.new
      @order_detail.item_id = ca.item_id
      @order_detail.order_id = @order.id
      @order_detail.quantity = ca.quantity
      @order_detail.production_status = 0
      @order_detail.price = ca.item.total_payment*ca.quantity
      @order_detail.save
      ca.destroy
    }
    redirect_to thanks_orders_path
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def confirm
    @confirm = Order.new(order_params)
    logger.debug("-------------------------ABC---------------------")
    logger.debug(@confirm.payment_method_i18n)
    if params[:address_mode].to_i == 1
      logger.debug("ご自身の住所")
      @confirm.postal_code = Customer.find(1).postal_code
      @confirm.address = Customer.find(1).address
      @confirm.name = Customer.find(1).family_name+Customer.find(1).first_name
    elsif params[:address_mode].to_i == 2
      logger.debug("登録済み住所から選択")
      @confirm.postal_code = Address.find(@confirm.postage).postal_code
      @confirm.address = Address.find(@confirm.postage).address
      @confirm.name = Address.find(@confirm.postage).name
    elsif params[:address_mode].to_i == 3
      logger.debug("新しいお届け先")
      @address = Address.new
      @address.customer_id = 1
      @address.postal_code = @confirm.postal_code
      @address.address = @confirm.address
      @address.name = @confirm.name
      @address.save
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
  # params[:order][:address_mode]
  # o.radio_buttonみたいな形で取り出すときは上記の形で引き出す
  # 一旦paramsで受け取ってからorder_paramsで選択している
  # 逆にpermitへOrderが持たないカラムの属性を書き込む(この場合は:address_mode)とエラーが起きる
  def order_params
    params.require(:order).permit(:customer_id, :order_id, :status, :postal_code, :address, :name, :postage, :price, :payment_method)
  end
end
