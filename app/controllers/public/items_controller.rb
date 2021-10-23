class Public::ItemsController < ApplicationController
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
  end

  def destroy
    @delete = Item.find(params[:id])
    @delete.destroy
    redirect_to root_path
  end


  private

  # def cart_item_params
    # require:
end
