class CommentsController < ApplicationController
   

    def show
      @comments = Comment.all
    end
    
    # def new
    #   @post = Post.find_by(id: params[:post])
    #   @comment = @post.comments.build
    #   @nested_comments = Comment.build(commentable_id: @comment[:id], commentable_type: 'Comment')
    #   debugger
      # @comment = Comment.new
    # end

    def create
      @comment = Comment.new(comment_params)
      # debugger
      @comment.save
    end

    private

    def comment_params
      params.required(:comment).permit(:user_id, :commentable_id, :commentable_type, :body)
    end
end
