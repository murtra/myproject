class PostsController < ApplicationController


  before_filter :authenticate_user!

  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end


  def create

    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      flash[:success] = "Post created successfully!"
      else
      render new_post_path
    end
  end

  private

    
    
    def post_params
      params.require(:post).permit(:content, :user_id )
    end

    
end
