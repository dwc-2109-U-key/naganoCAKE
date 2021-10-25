class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: 1)
  end

  def create
    @create = Address.new(address_params)
    @create.customer_id = 1
    @create.save
    @address = Address.new
    @addresses = Address.where(customer_id: 1)
    redirect_to addresses_path
  end

  def edit
    @edit = Address.find(params[:id])
  end

  def update
    @update = Address.find(params[:id])
    @update.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @destroy = Address.find(params[:id])
    @destroy.destroy
    @address = Address.new
    @addresses = Address.where(customer_id: 1)
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
