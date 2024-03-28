class HomesController < ApplicationController
  
  # debugger
  def index
    # debugger
    current_user_follow_id = []
    current_user.followees.ids.each do |a|
      current_user_follow_id.push(a)
    end
    total_posts_ids = current_user_follow_id.push(current_user.id)
    @posts = Post.where(user_id: total_posts_ids)
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