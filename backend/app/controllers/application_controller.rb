class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	skip_before_action :verify_authenticity_token, raise: false
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
	end

	def cookie_destroy
    request.session_options[:skip] = true
  end
end
