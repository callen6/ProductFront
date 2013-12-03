class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def create
	end
	def show
		@product  = Product.find(params[:id])
	end
end