class Api::V1::SessionsController < Api::V1::BaseController
  def create
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      cookies[:name] = @user.name
      cookies[:token]= { value: cookies[:name], expires: 15.minutes.from_now }
      self.current_user = @user
    else
        render :status => 401
    end
  end

  private

  def create_params
    params.permit(:email, :password)
  end
end
