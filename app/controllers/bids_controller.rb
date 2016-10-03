class BidsController < ApplicationController
  def create
    bid_params = params.require(:bid).permit(:price)
    @bid = Bid.new bid_params
    @auction = Auction.find params[:auction_id]
    @bid.auction = @auction
    @bid.user = session[:user_id]
    if @bid.save
      redirect_to auction_path(@auction), notice: "Bid Submitted"
    else
      redirect_to auction_path(@auction), notice: "Bid Unsuccessful"
    end
  end
end
