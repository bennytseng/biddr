class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @auctions = Auction.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.username = current_user
    if @auction.save
      flash[:notice] = "Bid created successfully"
      redirect_to auctions_path
    else
      render :new
    end
  end

  private
  def auction_params
    params.require(:auction).permit(
     :title, :details, :date, :price)
 end

end
