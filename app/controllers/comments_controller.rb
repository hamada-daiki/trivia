class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = Comment.new(body: params[:body], from_user_id: current_user.id, post_id: params[:post_id])
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to controller: 'posts', action: 'index'
    else
      flash.now[:alert] = "空白の投稿は出来ません"
      render action: :new
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def get_post
    Post.find_by(id: params[:post_id])
  end
end
