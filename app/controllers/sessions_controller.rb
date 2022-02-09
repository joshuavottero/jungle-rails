class SessionsController < ApplicationController
  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to :root
  #   else
  #     redirect_to :back
  #   end
  # end

  def create
    user = User.new()
    if user = user.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end


