class ContactsController < ApplicationController

   def create
    @contact = Contact.new(contact_params)
    @contact.user = User.find(session[:user_id])
    if request.xhr?
      p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      p "REQUEST IS XHR XHR XHR"

    else
      p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      p "REQUEST NON XHR"
      if @contact.save
        p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        p 'contact saved'
        p @contact
        redirect_to "/users/#{session[:user_id]}"
      else
        p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        p 'unable to save'
        p @contact
        @message = "Invalid Contact."
        redirect_to "/users/#{session[:user_id]}"
      end
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name,:phone_number)
    end

end
