module ReservationsHelper
  def reservation_url(reservation)
    return "localhost:3000/#{reservation.id}/reserved"
  end
end
