class SessionsController < ApplicationController
  def new
  end

  def create
    #user = User.new()
    puts "email #{params[:session]}"
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
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

  private
  def session_params
    params.require(:session).permit(
      :email, 
      :password)
  end
end


