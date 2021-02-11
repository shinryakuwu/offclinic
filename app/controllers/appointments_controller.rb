class AppointmentsController < ApplicationController
  before_action :check_user, only: [:edit]
  before_action :many_active_redirect, only: [:edit]

  def index
    if patient_signed_in?
      @appointments = Appointment.where(patient_id: current_patient.id)
      @active_appointments = Appointment.where(patient_id: current_patient.id, status: "active")
    elsif doctor_signed_in?
      @appointments = Appointment.where(doctor_id: current_doctor.id)
      @active_appointments = Appointment.where(doctor_id: current_doctor.id, status: "active")
    end
  end

  def edit
  end

  def new
    @doctor = Doctor.find_by_id(params[:doctor_id])
    @@doctor_id = params[:doctor_id]
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment request was successfully created.'
    else
      redirect_to "/doctors/profile/#{@@doctor_id}", notice: 'Something went wrong. Please try again.'
    end
  end

  def update
    @appointment = Appointment.find_by_id(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment was successfully updated.'
    else
      redirect_to appointments_path, notice: 'Something went wrong. Please try again.'
    end
  end

  private

  def appointment_params
      params.require(:appointment).permit(:time, :status, :doctor_id, :patient_id, :comment)
  end

  def check_user
    @appointment = Appointment.find_by_id(params[:id])
    if patient_signed_in?
      @user_id = current_patient.id
      @appointment_owner = @appointment.patient_id
    elsif doctor_signed_in?
      @user_id = current_doctor.id
      @appointment_owner = @appointment.doctor_id
    end
      
    unless (@appointment_owner == @user_id)
      redirect_to appointments_path, notice: "It's a dirty way to break my app, I don't like you :/"
    end
  end

  def many_active_redirect
    if @appointment.status == "to be accepted" && doctor_signed_in? && params[:accept] == "true"
      @active_appointments = Appointment.where(doctor_id: current_doctor.id, status: "active")
      if @active_appointments.size >= 10
        redirect_to appointments_path, notice: "You cannot have more than 10 active appointments at the same time."
      end
    end
  end

end