class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_NAME"], password: ENV["AUTHENTICATION_PASSWORD"],
except: []
  def show
  end
end
