class UsersController < ApplicationController
  def new

  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :back
    end
  end

  scope :ci_find, lambda  { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
