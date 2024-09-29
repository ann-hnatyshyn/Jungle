class Admin::DashboardController < ApplicationController
  before_action :authenticate
  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end

class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end



