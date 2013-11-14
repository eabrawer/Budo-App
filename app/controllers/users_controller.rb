class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to users_path, :notice => "Your account was
      successfully updated!"
  	else
  		render 'edit'
      flash.now[:alert] = "Your account was not updated!"
  	end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_url, :notice => "Your account was
      successfully created!"
  	else
  		render 'new'
      flash.now[:alert] = "User was not created"
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_url, :notice => "Your account was
    successfully deleted!" 
  end

  def user_params
  	params.require(:user).permit(:name, :email, 
  	:password, :password_confirmation, :province, 
  	:city, :age, :description)
  end
end
