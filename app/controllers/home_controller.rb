class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def buy
    @product = Product.find(params[:id])
  end
end
