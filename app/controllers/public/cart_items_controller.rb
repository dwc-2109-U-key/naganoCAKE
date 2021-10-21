class Public::CartItemsController < ApplicationController
  def index
    # @cart_items = CartItem.all
    @cart_items = CartItem.where(customer_id: 1)
    @price = @cart_items.sum { |hash| Item.find(hash[:item_id]).total_payment*hash[:quantity] }
  end

  def create
    @create = CartItem.new(cart_item_params)
    @create.save
    redirect_to cart_items_path
  end

  def update
    @update = CartItem.find(params[:id])
    @update.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    logger.debug("destroyしたよ")
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end
end
