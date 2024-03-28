class ProfilesController < ApplicationController
  def show
    # debugger
    @user = User.find_by(id: params[:id])
  end
  def index
    @current_user_posts = current_user.posts
  end

  def edit
    @current_user = User.find_by(id: params[:id])
    @current_user_profile = Profile.find_by(user_id: @current_user)
  end

  def update
    @current_user_profile = Profile.find_by(id: params[:id])

    if @current_user_profile.update(current_user_profile_params)
      redirect_to profiles_path(@current_user_profile)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def current_user_profile_params
    params.require(:profile).permit(:full_name, :bio, :phone_number, :dob, :gender, :image , :status)
  end
  
end



