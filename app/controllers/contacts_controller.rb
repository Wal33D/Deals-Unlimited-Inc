class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact_store = ContactStore.new
    @contact_store = ContactStore.new(:name=>@contact.name, 
                     :email=>@contact.email,
                     :tel=>@contact.tel,
                     :message=>@contact.message)
    @contact.request = request
    @contact_store.save

    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end