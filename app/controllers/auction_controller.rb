class AuctionController < ApplicationController
  def index
    #@auctions = Auction.find_by(post.user.id: @current_user.id)
    #@auctions = Auction.joins(:posts).where("posts.id =?", 
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.find_by(id: params[:id])
    @auction = Auction.new()
    @auctions = Auction.where(post: Post.find_by(id: params[:id]) ).order("suggested_price DESC")
    #if @auctions.first price = @auctions.first.suggested_price
  end

  def show
    @auction = Auction.find_by(id: params[:id])
  end

  def create
    @auction = Auction.new(create_params)
    @auction.isShowed = true;
    @auction.post = Post.find_by(id: params[:id])
    @auction.user = User.find_by(id: @current_user.id)

    #入リョクされた数値が@post.price以上かつ過去に投稿されたauctionの中の最高値よりも高い時saveを走らせる

    if @auction.save
      flash[:notice] = "入札が完了しました"
      redirect_to("/posts/#{@auction.post.id}")
    else
      session[:error] = @auction.errors.full_messages
      redirect_to("/auctions/#{@auction.post.id}/new")
    end

  end

  def destroy
    @auction = Auction.find_by(id: params[:id])
    id = @auction.post.id
    @auction.destroy
    flash[:notice] ="入札を取り消ししました"
    redirect_to("/posts/#{id}")
  end

  def create_params
    params.require(:auction).permit(
      :suggested_price,
    )
  end
end
