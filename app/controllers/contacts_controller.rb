class ContactsController < ApplicationController
  respond_to :json

# get help for this guy https://www.youtube.com/watch?v=OI-m0wbmf8A
  def create
    @contact = Contact.create!(contact_params)
    if @contact.present?
# binding.pry
      UserMailer.signup_confirmation(@contact).deliver
    end

    respond_with(@contact)
  end

  private


  def contact_params
    params.permit(:id, :first_name, :last_name, :email, :subject, :comment)
  end



end