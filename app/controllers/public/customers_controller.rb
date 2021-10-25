class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(1)
  end

  def edit
    @edit = Customer.find(1)
  end

  def quit
  end
end
