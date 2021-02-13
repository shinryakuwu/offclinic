class PatientsController < ApplicationController
	load_and_authorize_resource
	
  def show
  	@patient = Patient.find_by_id(params[:id])
  end

end
