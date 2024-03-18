module ApplicationHelper

  def user_image_url(user)
    user.image.present? ? url_for(user.image) : "default-user.jpg"
  end

end

