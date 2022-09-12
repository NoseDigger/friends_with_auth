class UsersController < ApplicationController

  before_action :authenticate_authen!, except: [:index, :show]

  before_action :correct_user, only: [:edit,:update,:destroy]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    # @user = User.
    @user = current_authen.users.build
  end
  def create
    # @user = User.new(user_params)
    @user = current_authen.users.build(user_params)
    @user.user_id = current_authen.id
    if @user.save
      redirect_to @user
    else
      render :new,status: :unprocessable_entity
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit,status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, status: :see_other
  end

  def correct_user
    
    @user = current_authen.users.find_by(id: params[:id])
    redirect_to user_path, notice: 'Not Authorized' if @user.nil?
  end


  private
  def user_params
    params.require(:user).permit(:name,:age,:city,:dob,:number,:user_id)
  end
end
