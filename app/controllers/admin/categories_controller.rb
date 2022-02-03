class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def new

  end
end
