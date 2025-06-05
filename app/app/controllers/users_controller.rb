class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create confirm_email]
  before_action :set_user , only: %i[show edit update destroy]

  def index
    @users = User.all
  end
  
  def show; end 
  
  def edit; end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    
    if @user.save
      UserMailer.with(user: @user).confirm_account.deliver_later
      redirect_to root_path, notice: "An Email was sent to your email account."
    else
      render :new, status: :unprocessable_entity
    end
      
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id]=nil if current_user == @user
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end
  
  def confirm_email
    user = User.find_by(token: params[:token])
    user.update!(is_confirmed?: true)
    redirect_to login_path, notice: "You're account has been confirmed."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
