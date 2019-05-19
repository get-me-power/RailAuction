class AuctionController < ApplicationController
  def index
    @auction = Auction.new()
  end

  def create
    @auction = Post.find_by(id: params[:id]).auction  
  end
end
