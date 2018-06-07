class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    p= Post.find(params[:post_id])
    @comment.post_id = p
    if @comment.save
      redirect_to "/posts/<%= p.id %>"
    else
      render "/comments/new"
    end
  end

  def edit
  end

  def show
  end


private
	def comment_params
		params.require(:comment).permit(:title,:content,:user_id,:post_id)
	end 
end
