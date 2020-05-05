class HomeController < ApplicationController
  before_action :check_current_user,only:[:index]
  def index
  end

  def menu
    @posts = Post.all.order(created_at: "DESC")
    @categorys = ["食べ物","洋服","美容","医療","勉強","スポーツ","ゲーム","保険","お金","その他"]
    # [1,2,3,4,5,6,7,8,9,10,11]
    @category = Post.group(:category).order('count_all DESC').count
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    @lank = 1
  end

  def category
    @categorys = ["食べ物","洋服","美容","医療","勉強","スポーツ","ゲーム","保険","お金","その他"]
    # [1,2,3,4,5,6,7,8,9,10,11]
    @category = Post.group(:category).order('count_all DESC').count
  end

  def userlank
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    @lank = 1
  end

  def check_current_user
    if current_user
      redirect_to posts_path
    end
  end
end
