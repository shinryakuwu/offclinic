module ApplicationHelper

	def avatar_for(user)
		if user.avatar?
			image_tag user.avatar.url(:thumb)
		else
			image_tag "default_avatar.png"
		end
	end

	def authenticate_a_user
	    unless doctor_signed_in? || patient_signed_in?
	      authenticate_patient!
	    end
	end

end
