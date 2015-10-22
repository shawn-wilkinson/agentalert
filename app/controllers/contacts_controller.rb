class ContactsController < ApplicationController

   def create
    @contact = Contact.new(contact_params)
    @contact.user = User.find(session[:user_id])
    if request.xhr?
    else
      if @contact.save
        redirect_to "/users/#{session[:user_id]}"
      else
        @message = "Invalid Contact."
        redirect_to "/users/#{session[:user_id]}"
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.user.id == session[:user_id]
      @contact.destroy
      redirect_to "/users/#{session[:user_id]}"
    else
      redirect_to "/"
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name,:phone_number)
    end

end
