class AddressesController < ApplicationController
	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			redirect_to orders_confirm_path
		else
			render template: "addresses/new"
		end
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
