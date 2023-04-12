class UsersController < ApplicationController
  def account
  end

  def profile
  end

  def profile_edit
    @user = User.find(current_user.id)
  end

  def profile_update
    @user = User.find(current_user.id)
    @user.update(params.require(:user).permit(:name,:profile,:image))
    redirect_to "/users/profile"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end
end
