class AuctionController < ApplicationController
  def index
    @auction = Post.find_by(id: params[:id]).auction  
  end
end
