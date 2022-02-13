class Api::V1::HabitationsController < ApplicationController
  def index
    @habitations = Habitation.all
  end

  def show
    @min_terget = Habitation.all
  end

  def create
  end
end
