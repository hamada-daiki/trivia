class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:follower,:following]
  before_action :check_correct_user, only:[:edit]

  def index
    @users = User.all
  end

  def show
    @posts = Post.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
  end

  def like
    @user = User.find(params[:id])
    @likes = Like.where(user_id: params[:id]).order(created_at: "DESC")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def follower
    @followers = Relationship.where(follow_id: @user.id)
  end

  def following
    @following = Relationship.where(user_id: @user.id)
  end

  def search
    if !(@user = User.find_by(username: params[:search]))
      flash[:notice] = "該当するユーザはいませんでした"
      redirect_to "/users/index"
    else
      redirect_to "/users/#{@user.id}"
    end

  end

  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:username]
    if @user.save
      flash[:notice] = "ユーザ情報変更"
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:alert] = "名無しはダメです"
      render :edit
    end
  end


  private
  def set_user
    @user = User.find_by(id: params[:id])
  end

  def check_correct_user
    if params[:id].to_i != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to controller: :posts, action: :index
    end
  end
end
