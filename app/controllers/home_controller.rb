class HomeController < ApplicationController
	before_action :redirect_when_logged_in

	def index
		
	end

	def redirect_when_logged_in
		if doctor_signed_in?
			redirect_to edit_doctor_registration_path
		elsif patient_signed_in?
			redirect_to edit_patient_registration_path
		end		
	end

end