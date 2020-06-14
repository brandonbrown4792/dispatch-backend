class Api::V1::SessionsController < ApplicationController
  
  def create
    @user = User.find_by(email: session_params[:email])

    if @user
      if @user.authenticate(session_params[:password])
        token = JWT.encode({ user_id: @user.id }, ENV['SUPER_SECRET_KEY'])
        render json: { token: token }, status: :ok
      else
        render json: { message: 'Password is incorrect' }, status: :unauthorized
      end
    else
      render json: { message: "That email does not exist" }, status: :not_found
    end
  end

  def destroy
  end
  
  private

  def session_params
    params.require(:user).permit(:email,:password)
  end

end
