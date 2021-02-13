class DoctorsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @doctors = Doctor.all
    @category = Category.first
  end

  def show
	  @doctor = Doctor.find_by_id(params[:id])
  end

  def search
  	@doctors = Doctor.where("category_id = ?", params[:category_id])
  	@category = Category.find_by_id(params[:category_id])
  end

end
