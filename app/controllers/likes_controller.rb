class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @like[:master_user_id] = User.find(Post.find(params[:post_id]).user_id).id
    @like.save
    puts "======create======="
    puts "==============================================
          #{Like.group(:master_user_id).order('count_all DESC').count}"
    @lanking = Like.group(:master_user_id).order('count_all DESC').count
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
