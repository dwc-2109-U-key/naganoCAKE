class Public::ItemsController < ApplicationController
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
  end

  private

  # def cart_item_params
    # require:
end
