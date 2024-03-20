module HomesHelper

  def exist_like_or_not(likeable_id, likeable_type)
    Like.find_by(user_id: current_user.id , likeable_id: likeable_id, likeable_type: likeable_type).present?
  end
  
end
