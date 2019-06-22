class Admin::ArtistsController < Admin::ApplicationController
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.find_or_create_by(artist_name: params[:artist][:artist_name])
		if @artist.save!
			redirect_to new_admin_product_path
		else
			render :new
		end
	end

	private

	def artist_params
		params.require(:artist).permit(:artist_params, :artist_hiragana)
	end

end
