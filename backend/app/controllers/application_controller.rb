class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	skip_before_action :verify_authenticity_token, raise: false
	before_action :configure_permitted_parameters, if: :devise_controller?
end
