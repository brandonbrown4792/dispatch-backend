class Api::V1::AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:update, :destroy]

  def create
    @appointment = Appointment.new(appointment_params)
    @user = User.find_by(id: appointment_params[:patient_id])
    if @user
      @appointment.address = @user.address
    end
    @appointment.save
    if @appointment.persisted?
      render :json => @appointment, :status => :ok
    else 
      render :json => { msg: "Appointment Creation Failed." }, :status => :bad_request
    end
  end

  def update
    if appointment_params[:nurse_id]
      @appointment.nurse_id = appointment_params[:nurse_id]
    end
    if appointment_params[:patient_id]
      @appointment.patient_id = appointment_params[:patient_id]
    end
    if appointment_params[:start_time]
      @appointment.start_time = appointment_params[:start_time]
    end
    if appointment_params[:length]
      @appointment.length = appointment_params[:length]
    end
    if appointment_params[:reason]
      @appointment.reason = appointment_params[:reason]
    end 
    if @appointment.save
      render :json => @appointment, :status => :ok
    else
      render :json => { msg: "Appointment update failed." }, :status => :bad_request
    end
  end

  def destroy
    @appointment.destroy
    if @appointment.persisted?
      render :json => { msg: "Delete failed!"}, :status => :bad_request
    else
      render :json => { msg: "Appointment was destroyed!"}, :status => :ok
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :nurse_id, :start_time, :length, :reason)
  end

  def find_appointment
    @appointment = Appointment.find_by(id: params[:id])
    if !@appointment
      render :json => { msg: "Could not find appointment" }, :status => :bad_request
    else
        return @appointment
    end
  end

end

