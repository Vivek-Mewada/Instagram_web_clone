class CommentsController < ApplicationController
   

    def show
      @comments = Comment.all
      # @comment = Comment.where(commentable_id: params[:id], commentable_type: 'Post')
     
    end

    def new
      # debugger
      @post = Post.find_by(id: params[:post])
      @comment = @post.comments.build
    end

    def create
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.new(comment_params)
      # debugger
      @comment.save
    end

    private

    def comment_params
      params.required(:comment).permit(:user_id, :commentable_id, :commentable_type, :body)
    end
end
