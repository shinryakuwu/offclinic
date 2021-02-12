class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :category_id])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :category_id, :description, :avatar])
	end
end
