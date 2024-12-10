class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:meal)

    @qr_codes = @reservations.map do |reservation|
      RQRCode::QRCode.new(reservation_url(reservation))
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to reservations_path, notice: "Reservation successfully created!"
    else
      redirect_to meal_path(@reservation.meal), alert: "Failed to create reservation. Please try again."
    end
  end

  def reservation_url(reservation)
    return "localhost:3000/#{reservation.id}/reserved"
  end

  private

  def reservation_params
    params.permit(:meal_id, :timeslot)
  end
end
