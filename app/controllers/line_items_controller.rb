class LineItemsController < ApplicationController
	def create
		LineItem.create(user_id: params[:user_id], product_id: params[:product_id])
		redirect_to :cart
	end
	def index
		@line_items = current_user.line_items.in_cart
		@sum = @line_items.sum { |item| item.product.price }
	end
	def delete
		LineItem.find(params[:line_id]).destroy
		redirect_to :cart
	end
	def show
		# get all the product purchases
		purchases = LineItem.all
		# separate all the purchases by item
		array = []
		purchases.each do |line|
			array << line.product_id
		end
		#count each item's purchases
		@purchases_count=Hash[array.group_by {|x| x}.map {|k,v| [k,v.count]}]
		# => {product_id:count, product_id:count, ...}
		# display them in ascending order
	end
end