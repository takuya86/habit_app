class Api::V1::FavoritesController < ApplicationController
  def create
    current_api_v1_user.favorites.create!(favorites_params)
    head :created
  end

  def destroy
    current_api_v1_user.favorites.find(params[:id]).destroy!
    head :ok
  end

  private

    def favorites_params
      params.require(:favorite).permit(:habitation_id)
    end
end
