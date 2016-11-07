class Api::V1::SessionsController < Api::V1::BaseController
  def login
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
    else
        render :status => 401
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
