class ContactsController < ApplicationController

    def index
      user = User.find(params[:user_id])
      user_contacts = user.contacts + user.shared_contacts
      render json: user_contacts
    end

    def show
      contact = Contact.find(params[:id])
      render json: contact
    end

    def create
      contact = Contact.new(contact_params)
      if contact.save
        render json: contact
      else
        render json: contact.errors.full_messages, status: :unprocessable_entity
      end

    end

    def update
      contact = Contact.find(params[:id])
      if contact.update(contact_params)
        render json: contact
      else
        render json: contact.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      contact = Contact.find(params[:id])
      render json: contact.destroy
    end

    def favorited
      contact = Contact.find(params[:id])
      render json: contact.favorited
    end

    def toggle_favorite
      contact = Contact.find(params[:id])
      contact.favorited = !contact.favorited
      render json: contact
    end

    private
      def contact_params
        params.require(:contact).permit(:name, :email, :user_id)
      end

end
