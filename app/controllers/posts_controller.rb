class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    if @post.save
      redirect_to "/"
    else
      render "/posts/new"
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
   
    @comment = Comment.new

    # controller => "comments", :action => "new"
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id 
    # @comment.post_id = params[:post_id]
    # if @comment.save
    #   redirect_to "/"
    # else
    #   render "/comments/new"
    # end
  end



private
	def post_params
		params.require(:post).permit(:title,:content,:user_id)
	end
end
