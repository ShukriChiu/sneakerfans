class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:update]

  def create
    @user = User.create(create_params)
    @user.save
    render :status => 201
  end

  def show
    if (@user = User.find(params[:id]))
    else
      render :status => 404
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(update_params)
  end

  def destroy
    @user = User.find(params[:id])
    if (@user)
      @user.destroy
      render :noting => true, :status => 204
    end
  end

  private
  def create_params
    params.require(:user).permit(:email, :name, :password)
  end

  def update_params
    params.require(:user).permit(:name)
  end
end