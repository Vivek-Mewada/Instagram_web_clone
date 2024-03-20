class LikesController < ApplicationController

  def create
    record = Like.find_by(user_id: params[:user_id], likeable_id: params[:likeable_id], likeable_type: params[:likeable_type] )
    if record.present?
      record.destroy
      like_count = Post.find_by(id: params[:likeable_id]).likes.count
      render json: {count: like_count , likeable_id: record.likeable_id, likeable_type: record.likeable_type, userId: record.user_id, like: false }
    else
      @like = Like.new(like_params)
      @like.save
      # debugger
      like_count = Post.find_by(id: params[:likeable_id]).likes.count
      render json: {count: like_count,  likeable_id: @like.likeable_id, likeable_type: @like.likeable_type, userId: @like.user_id, like: true }
    end
  end

  private
  def like_params
    params.required(:like).permit(:user_id, :likeable_id, :likeable_type )
  end
end
