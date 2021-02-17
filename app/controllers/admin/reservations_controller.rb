class Admin::ReservationsController < Admin::Base
  def index
    @reservations = Reservation.order(:id)
  end
end
