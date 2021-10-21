class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
    @items = @items.sort_by{|f| f[:create_at]}.reverse!
    @items4 = @items.first(4)
  end

  def login
    @genres = Genre.all
    @items = Item.all
  end

  def about
  end

  def search
    @genres = Genre.all
    @items = Item.where(genre_id: params[:id].to_i)
  end
end
