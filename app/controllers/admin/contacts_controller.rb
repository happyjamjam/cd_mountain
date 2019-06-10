class Admin::ContactsController < ApplicationController
  def index
  	@contacts = Contact.page(params[:page])
  end
end
