class Public::CustomersController < ApplicationController

    #マイページ
  def show
   @public = current_public
  end
  
  #マイページ編集
  def edit
    @public = current_public
  end
  
 #マイページ保存
  def update
    @public = current_public
  	@public.update(customer_params)
  	redirect_to public_customer_path
  end
  
  def withdrawl
      
  end
  
  def quit
      
  end
  
  def out
    customer = current_customer #情報を入れる
    customer.update(withdrawl: true) #withdrawlをtrueへ
    reset_session #データをリセットする
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path #トップ画面へ
  end
  
    private
        def customer_params
            params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_customer_status)
        end
end
