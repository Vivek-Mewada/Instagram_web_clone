class HomesController < ApplicationController
  
  def index
    # debugger
    @posts = Post.all
    @comments = Comment.all
    # @comment = Comment.where(commentable_id: params[:id], commentable_type: 'Post')

  end

end