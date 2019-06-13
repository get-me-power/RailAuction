class AuctionController < ApplicationController
  def index
    #@auctions = Auction.find_by(post.user.id: @current_user.id)
    #@auctions = Auction.joins(:posts).where("posts.id =?", 
    @post = Post.find_by(id: params[:id])
  end

  def new
    @auction = Auction.new()
  end

  def create
    @auction = Auction.new(create_params)
    @auction.post = Post.find_by(id: params[:id])
    if @auction.save
      flash[:notice] = "入札が完了しました"
      redirect_to("/posts/#{@auction.post.id}")
    else
      session[:error] = @auction.errors.full_messages
      redirect_to("/auctions/#{@auction.post.id}/new")
    end

  end

  def create_params
    params.require(:auction).permit(
      :suggested_price,
    )
  end
end
