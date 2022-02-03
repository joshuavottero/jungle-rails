class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_NAME"], password: ENV["AUTHENTICATION_PASSWORD"],
except: []
  
  def index
    @categories = Category.all.order(:name)
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end

  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
