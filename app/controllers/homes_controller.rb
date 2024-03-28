class HomesController < ApplicationController
  
  # debugger
  def index
    # debugger
    @posts = Post.all
    @comments = Comment.all
    # @comment = Comment.where(commentable_id: params[:id], commentable_type: 'Post')
  end

  def follow
    Follow.create_or_find_by(follower_id: current_user.id, followee_id: params[:id])
    @user = User.find_by(id: params[:id])
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: [
    #       turbo_stream.replace(dom_id(user),
    #                             partial: 'homes/follow_button',
    #                             locals: {user: user })
    #     ]
    #   end
    # end
  end

  def unfollow
    current_user.followed_users.where(follower_id: current_user.id, followee_id: params[:id]).destroy_all
    @user = User.find_by(id: params[:id])
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: [
    #       turbo_stream.replace(dom_id(user),
    #                             partial: 'homes/follow_button',
    #                             locals: {user: user })
    #     ]
    #   end
    # end
  end
  
end