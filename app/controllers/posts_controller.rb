class PostsController < ApplicationController

  def show
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  private
  
  def post_params
    params.required(:post).permit(:desc, :user_id, images: [])
  end
end

