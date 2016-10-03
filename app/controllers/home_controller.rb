class HomeController < ApplicationController

  def index
  end

  def current_bids
    @bids = Bid.where(user: session[:user_id])
  end

end
