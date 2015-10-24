require 'net/http'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @user = User.find(session[:user_id])
    @contacts = @user.contacts
  end

  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      uri = URI.parse("/interface/user_signup/#{@user.id}")
      request = Net::HTTP.get(uri)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @message = "Invalid Registration. Please Try Again."
      render :new
    end
  end


  def update
  end

  def login
  end

  def test_number
    @user = User.find(session[:user_id])
    @name = @user.name
    @number = @user.phone_number
    redirect_to "/interface/test_number"
  end

  def authenticate
    @user = User.find_by email: params[:user][:email]
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      @error = "Invalid Login"
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:name,:email,:phone_number,:panic_word,:password)
    end
end
