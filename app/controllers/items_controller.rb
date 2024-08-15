class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_if_not_owner, only: [:edit, :update]
  def new
    @item = Item.new
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_owner
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
