class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:update]
  
  def create
    @user = User.create(create_params)
    tech_string = params[:techs]
    tech_string.tr('[]', '').tr('"','').split(', ').map(&:to_i).each do |tech_id|
      @affection = Affection.create([:user_id => @user.id, :tech_id => tech_id])
    end
    render :status => 201
  end
  
  def show
    if (@user = User.find(params[:id]))
    else
      render json: nil, :status => 404
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
      render json: nil, :status => 204
    end
  end
  
  def validate
    if (@user = User.find_by_email(params[:email]))
      render :status => 409
    else
      render json: nil, :status => 200
    end
  end
  
  private
  def create_params
    params.permit(:email, :name, :password)
  end
  
  def validate_params
    params.permit(:email)
  end
  
  def update_params
    params.permit(:name)
  end
end