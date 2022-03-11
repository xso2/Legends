class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ] 
  before_action :set_tweet, only: [:edit]
  before_action :move_to_index, except: [:index, :show]


  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet? @tweet.comments.includes(:user) :[]
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id )
  end

  def set_tweet
    @tweet = Tweet.find(tweet_params)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
