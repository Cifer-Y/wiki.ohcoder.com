class UsersController < ApplicationController
=begin
  def signup
    @user = User.new
  end
=end

  def login

  end

  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      cookies.permanent[:token] = user.token
      redirect_to root_path, :notice => "login success!"
    else
      flash[:error] = "error name or password"
      redirect_to :login
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to root_path, :notice => "logout success!"
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to :root, :notice => "sign up success!"
    else
      render :signup
    end
  end

  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
