class MyProductsController < ApplicationController
    
    def index
        @products = Product.all
    end
    
end
