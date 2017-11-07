class Site::HomeController < ApplicationController
  layout "default"
  
  def index
    @categories = Category.all
  end
end
