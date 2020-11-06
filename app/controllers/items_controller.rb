class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:new]
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :prefecture_id, :condition_id, :shipping_date_id, :handling_charge_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @product.user.id
      redirect_to action: :index
    end
  end
end
