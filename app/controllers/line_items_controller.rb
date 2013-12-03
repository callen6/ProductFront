class LineItemsController < ApplicationController
	def create
		LineItem.create(user_id: params[:user_id], product_id: params[:product_id])
		redirect_to :cart
	end
end