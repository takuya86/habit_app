class Api::V1::HabitationsController < ApplicationController
  def index
    habitations = Habitation.all
    render json: habitations
  end

  def create
    habitation = Habitation.new(habitaiotn_params)
    if habitation.save
      render json: { status: 'SUCCESS', data: habitation }
    else
      render json: { status: 'ERROR', data: habitation.errors }
    end
  end

  private

  def habitaiotn_params
    params.permit(:min_target, :max_target, :period, :thoughts, :user_id)
  end
end
