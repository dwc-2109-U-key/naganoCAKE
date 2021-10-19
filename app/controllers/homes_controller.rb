class HomesController < ApplicationController
  def home
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
end
