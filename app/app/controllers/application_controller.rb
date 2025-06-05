class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :user_has_profile? 

  helper_method :current_user
  
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  rescue ActiveRecord::RecordNotFound
    session.delete(:user_id)
    nil
  end

  private 

  def authenticate_user!
    redirect_to login_path, notice: 'You have to be logged in.' unless current_user
  end

  def user_has_profile?
    if current_user && current_user.profile.nil?
      redirect_to new_profile_path, notice: "Tell us more about you"
    end
  end
end
