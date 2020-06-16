class Api::V1::AppointmentsController < ApplicationController

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
    @appointment = find_appointment
    if @appointment.update(appointment_params)
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
    params.require(:appointment).permit(:patient_id, :nurse_id, :address, :start_time, :length, :reason, :notes)
  end

  def find_appintment
    @appointment = Appointment.find_by(id: params[:id])
    if !@appointment
      render :json => { msg: "Could not find appointment" }, :status => :bad_request
    else
        return @appointment
    end
  end

end

