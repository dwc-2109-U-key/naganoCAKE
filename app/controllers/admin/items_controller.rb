class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
    @list = Array.new
    @genres.each { |g|
      @list.append([g.name, g.id])
    }
  end

  def index
  end

  def create
    @create = Item.new(item_params)
    @create.save
    redirect_to login_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @delete = Item.find(params[:id])
    @delete.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :total_payment, :status)
  end
end
