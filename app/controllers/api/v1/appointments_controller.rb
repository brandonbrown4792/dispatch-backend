class Api::V1::AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.create(appointment_params)
    render json: @appointment, status: ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :nurse_id, :address, :start_time, :length, :reason, :notes)
  end

  def find_appintment
    @user = Appointment.find_by(id: params[:id])
  end
end

