class AddOrderCompletedColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_completed, :boolean
  end
end
