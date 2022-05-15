class StoreController < ApplicationController
  def index
    # get all products &
    # order them alphabetically by title
    @products = Product.order(:title)
  end
end
