class PatientsController < ApplicationController
	include ApplicationHelper
  	before_action :authenticate_a_user
	load_and_authorize_resource
	
  def show
  	@patient = Patient.find_by_id(params[:id])
  end

end
