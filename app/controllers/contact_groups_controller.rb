class ContactGroupsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.contact_groups
  end

  def contacts
    contact_group = ContactGroup.find(params[:id])
    render json: contact_group.contacts
  end
  
end
