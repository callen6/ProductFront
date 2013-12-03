class OrdersController < ApplicationController
	def create

		### payment processing should happen  in here eventually ###

		# find all the user's current items in 'cart' (line_items)
		cart_items = current_user.line_items.in_cart
		# find total price of items
		total_amount = cart_items.sum { |item| item.product.price }
		# create a new order with a total price from line_items
		# update order_completed column to true
		order = Order.create(total_price: total_amount, order_completed: true)
		# associate those line items with order
		cart_items.each do |item|
			item.order = order
			item.save
		end
		# redirect somewhere
		redirect_to :root, notice: "checkout complete"
	end
	def index
		@orders = current_user.orders.complete
	end
	def show
		@order = Order.find(params[:id])
	end

end