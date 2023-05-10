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
    if @user.update(params.require(:user).permit(:name,:profile,:image))
       redirect_to "/users/profile"
    else
      render 'profile_edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end
end
