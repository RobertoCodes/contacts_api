class UsersController < ApplicationController

  def index
    render json: params
  end

  def show
    render json: params
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  private
    def user_params
      params[:user].permit(:name, :email)
    end

end
