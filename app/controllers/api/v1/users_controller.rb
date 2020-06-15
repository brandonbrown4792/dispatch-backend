class Api::V1::UsersController < ApplicationController
  
  before_action :authenticate, only: [:get_info, :update]

  def create
    @user = User.create(user_params)
    token = JWT.encode({ user_id: @user.id }, ENV['SUPER_SECRET_KEY'])
    render :json => { token: token }, :status => :ok
  end

  def update
  end

  def get_info
    user_type = current_user.get_user_type
    if user_type == 'dispatcher'
      render json: {
        email: current_user.email,
        user_type: user_type,
        nurses: current_user.dispatcher_nurses.as_json(only: [:id, :name, :email, :address, :latitude, :longitude]),
        patients: current_user.dispatcher_patients.as_json(only: [:id, :name, :email, :address, :latitude, :longitude])
      }, status: :ok
    elsif user_type == 'nurse'
      render json: {
        email: current_user.email,
        user_type: user_type,
        patients: current_user.patients.as_json(only: [:id, :name, :email, :address, :latitude, :longitude]),
        appointments: current_user.nurse_appointments.as_json(except: [:created_at, :updated_at], include: [notes: {only: :content}])
      }, status: :ok
    elsif user_type == 'patient'
      render json: {
        email: current_user.email,
        user_type: user_type,
        nurses: current_user.nurses.as_json(only: [:id, :name, :email]),
        appointments: current_user.patient_appointments.as_json(except: [:created_at, :updated_at], include: [notes: {only: :content}])
      }, status: :ok
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type, :address)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
