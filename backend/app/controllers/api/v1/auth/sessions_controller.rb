class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  before_action :cookie_destroy

  def cookie_destroy
    request.session_options[:skip] = true
  end
end
