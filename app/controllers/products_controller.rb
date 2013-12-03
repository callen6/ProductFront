class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def create
	end
	def show
		@product  = Product.find(params[:id])
		@purchases = LineItem.find(:all, conditions: {product_id: params[:id]}).count
	end
end