class HomeController < ApplicationController
	before_action :redirect_when_logged_in

	def index
		
	end

	def redirect_when_logged_in
		if doctor_signed_in?
			redirect_to "/doctors/profile/#{current_doctor.id}"
		elsif patient_signed_in?
			redirect_to "/patients/profile/#{current_patient.id}"
		end		
	end

end