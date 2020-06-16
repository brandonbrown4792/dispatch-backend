class Api::V1::AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    @user = User.find_by(id: params[:id])
    @appointment.address = @user.address
    @appointment.save
    if @appointment.persisted?
      render json: @appointment, status: ok
    else 
      render json: => { "msg" => "Appointment Creation Failed." }, :status => :bad_request
    end
  end

  def destroy
    @appointment.destroy
    if @appointment.persisted?
      render :json => { "msg" => "Delete failed!"}, :status => :bad_request
    else
      render :json => { "msg" => "Appointment was destroyed!"}, :status => :ok
    end
  end
  
  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :nurse_id, :address, :start_time, :length, :reason, :notes)
  end

  def find_appintment
    @user = Appointment.find_by(id: params[:id])
  end
end

