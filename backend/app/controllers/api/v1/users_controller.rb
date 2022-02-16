class Api::V1::UsersController < ApplicationController
  def mypage
    if current_api_v1_user
      render json: current_api_v1_user
    else
      render json: { error: 'ログインしてません' }, status: :not_found
    end
  end
end
