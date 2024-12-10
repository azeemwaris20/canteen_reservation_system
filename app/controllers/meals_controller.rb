class MealsController < ApplicationController
  before_action :authenticate_user!

  def show
    @meal = Meal.find(params[:id])
  end
end
