class Admin::DashboardController < ApplicationController
  def show
    @num_categories = Category.count
    @num_products = Product.count
  end
end
