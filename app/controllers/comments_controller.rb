class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to "/posts/#{params[:post_id]}"
      flash[:notice] = 'Comment created succesfully'
    else
      flash[:notice] = 'Comment was not created'
      render "/comments/new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

def update
    comment = Comment.find(params[:id])
    if(comment.update(comment_params))
      redirect_to "/posts/#{params[:post_id]}"
    else 
      render edit_comment_path
    end
end

  def show
  end


private
	def comment_params
		params.require(:comment).permit(:title,:content,:user_id,:post_id)
	end 
end
