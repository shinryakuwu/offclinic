module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_role
  end

  protected
  def check_role
    if current_admin
      flash.clear
      redirect_to rails_admin_path and return
    elsif current_patient
      flash.clear
      redirect_to "/patients/profile/#{current_patient.id}" and return
    elsif current_doctor
      flash.clear
      redirect_to "/doctors/profile/#{current_doctor.id}" and return
    end
  end
end