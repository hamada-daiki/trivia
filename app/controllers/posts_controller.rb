class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: "DESC")
    @categorys = ["食べ物","洋服","美容","医療","勉強","スポーツ","ゲーム","保険","お金","その他"]
    # [1,2,3,4,5,6,7,8,9,10,11]
    @category = Post.group(:category).order('count_all DESC').count
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    @lank = 1
  end

  def new
    @post = Post.new
    @message = ""
  end

  def show
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @post.id).count
    @comments = Comment.where(post_id: @post.id).order(created_at: "DESC")
    @comments_count = @comments.length
    @category = Post.group(:category).order('count_all DESC').count
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    @lank = 1
  end

  def create
    @post = Post.new(body: params[:body], user_id: current_user.id, img: params[:img], category: params[:category])
    if @post.save
      flash[:notice] = "投稿成功"
      redirect_to action: :index
    else
      flash.now[:alert] = "投稿失敗"
      render action: :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "削除しました"
      redirect_to action: :index
    end
  end

  def category
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    @lank = 1
    @category = Post.group(:category).order('count_all DESC').count
    case params[:id].to_i
    when 1
      @posts = Post.where(category: "食べ物")
    when 2
      @posts = Post.where(category: "洋服")
    when 3
      @posts = Post.where(category: "美容")
    when 4
      @posts = Post.where(category: "医療")
    when 5
      @posts = Post.where(category: "勉強")
    when 6
      @posts = Post.where(category: "スポーツ")
    when 7
      @posts = Post.where(category: "ゲーム")
    when 8
      @posts = Post.where(category: "保険")
    when 9
      @posts = Post.where(category: "お金")
    else
      @posts = Post.where(category: "その他")
    end
  end
end
