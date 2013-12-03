class OrdersController < ApplicationController
	def create

		### payment processing should happen  in here eventually ###

		# find all the user's current items in 'cart' (line_items)
		cart_items = current_user.line_items.in_cart
		# find total price of items
		total_amount = cart_items.sum { |item| item.product.price }
		# create a new order with a total price from line_items
		order = Order.create(total_price: total_amount)
		# associate those line items with order
		cart_items.each do |item|
			item.order = order
			item.save
		end
		# redirect somewhere
		redirect_to :root, notice: "checkout complete"
	end
end