class Admin::ContactsController < Admin::ApplicationController
  def index
  	@contacts = Contact.page(params[:page])
  end

  def show
  	@contact = Contact.find(params[:id])

  end

  def update

    contact = @contac
    user = contact.user
    ContactMailer.send_when_admin_reply(user, contact).deliver

  end

  def destroy
  	contact = Contact.find(params[:id])
  	contact.destroy
    redirect_to admin_contacts_path
  end

  def update
  end

end
