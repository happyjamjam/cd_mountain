class Admin::ContactsController < Admin::ApplicationController
  def index
  	@contacts = Contact.page(params[:page])
  end

  def show
  	@contact = Contact.find(params[:id])
    @newcontact = Contact.new
  end

  def update

    @contact = Contact.new.find(params[:id])

    contact = @contact
    user = contact.user
    ContactMailer.send_when_admin_reply(user, contact).deliver

    @newcontact.update
    redirect_to admin_contacts_path

  end

  def destroy
  	contact = Contact.find(params[:id])
  	contact.destroy
    redirect_to admin_contacts_path
  end


  def update
  end

end
