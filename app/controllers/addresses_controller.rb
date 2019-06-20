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
	end

	def update
	end

	def destroy
	end

	private

		def address_params
			params.require(:address).permit(:name, :postal_code, :address, :tel)
		end

end
