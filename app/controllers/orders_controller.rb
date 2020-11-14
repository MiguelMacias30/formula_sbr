class OrdersController < ApplicationController
  before_action :authenticate_user!

    def index
  		@orders = Order.where(user_id: current_user.id, paid: false)
  	end


  	def create
  		product = Product.find(params[:product_id])
  		order = Order.find_or_create_by(user_id: current_user.id, product_id: product.id, paid: false)
  		order.quantity += 1

  		if order.save
  			redirect_to products_path, notice: 'se ha añadido el producto al carro'
  		else
  			redirect_to products_path, alert: 'no se ha podido añadir al carro'
  		end
  	end

  	def destroy
  		order = Order.find(params[:id])
  		order.destroy
  		redirect_to orders_path, notice: 'se ha quitado el producto del carrito'
  	end

  	def clean
  		order = Order.where(paid: false)
  		order.destroy_all
  		redirect_to orders_path, notice: 'se ha vaciado el carrito'
  	end
  end
