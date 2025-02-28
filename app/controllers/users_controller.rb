class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end
end
