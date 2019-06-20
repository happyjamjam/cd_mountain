class AddressesController < ApplicationController

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			redirect_to addresses_path
		else
			render template: "addresses/new"
		end
	end

	def index
		@addresses = current_user.addresses
		calculation
  	@user_orders = current_user.carts.order(id: "DESC")
    @order = Order.new
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to user_path(current_user)
	end

	private

		def address_params
			params.require(:address).permit(:name, :postal_code, :address, :tel)
		end

end
