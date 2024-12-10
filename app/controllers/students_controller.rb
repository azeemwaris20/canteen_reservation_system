class StudentsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @meals = Meal.all
  end
end
