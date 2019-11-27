class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  def index
    @shares = Share.all
  end

  def new 
    @share = Share.new
    # binding.pry
  end

  def create
    @share = Share.new(share_params)
    if @share.save
      redirect_to shares_path
    else
      render :new
    end
  end

  def show;end

  def edit;end
  def update;end

  def destroy
    @share.destroy
    redirect_to shares_path
  end

  private
  def share_params
    params.require(:share).permit(:name, :title, :sharing)
  end

  def set_share
    @share = Share.find(params[:id])
  end
end
