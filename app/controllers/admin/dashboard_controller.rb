class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_NAME"], password: ENV["AUTHENTICATION_PASSWORD"],
except: []
  def show
    @product_total = Product.all.count()
    @category_total = Category.all.count()
  end

  private

  def info_about_products()
   
  end
end
