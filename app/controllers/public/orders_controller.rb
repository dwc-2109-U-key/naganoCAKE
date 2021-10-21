class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @list = Array.new
    # @order.each { |o|
      # @string = "〒"+o.postal_code+" "+o.address+" "o.name
      # @string = "〒#{o.postal_code} #{o.address} #{o.name}"
      # @list.append()
    # }
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanks
  end
end
