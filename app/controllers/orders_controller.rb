class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index, only: :index

  def index
    @order = Order.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
     )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif Order.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end
  
end
