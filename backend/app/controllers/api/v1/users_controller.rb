class Api::V1::UsersController < ApplicationController
  before_action :cookie_destroy

  def mypage
    if current_api_v1_user
      render json: current_api_v1_user
    else
      render json: { error: 'ログインしてません' }, status: :not_found
    end
  end

  def cookie_destroy
    request.session_options[:skip] = true
  end
end
