class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
	  if current_patient
	  	"/patients/profile/#{current_patient.id}"
	  elsif current_doctor
	  	"/doctors/profile/#{current_doctor.id}"
	  elsif current_admin
	  	rails_admin_path
	  end
	end

	def current_ability
	  if patient_signed_in?
	    @current_ability ||= Ability.new(current_patient)
	  elsif doctor_signed_in?
	    @current_ability ||= Ability.new(current_doctor)
	  elsif admin_signed_in?
	  	@current_ability ||= Ability.new(current_admin)
	  end
	end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :category_id])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :category_id, :description, :avatar])
	end
end
