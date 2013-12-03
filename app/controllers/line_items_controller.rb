class LineItemsController < ApplicationController
	def create
		LineItem.create(user_id: params[:user_id], product_id: params[:product_id])
		redirect_to :cart
	end
	def index
		@line_items = LineItem.all
	end
	def delete
		LineItem.find(params[:line_id]).destroy
		redirect_to :cart
	end
end