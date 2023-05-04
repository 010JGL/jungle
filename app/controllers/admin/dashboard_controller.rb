class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_BASIC_USER'], password: ENV['HTTP_BASIC_PASSWORD']

  def show
    #get the values from the database and assign to value here, pass it to the template
    @products_total = Product.count
    @categories_total = Category.count
  end
end
