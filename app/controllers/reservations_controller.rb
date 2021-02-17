class ReservationsController < ApplicationController
  before_action :login_required
  def index
    @reservations = current_member.reservations
  end
  def new
    @movie = Movie.find(params[:movie_id])
    @performance = Performance.find(params[:performance_id])
    @seat = Seat.find(params[:seat_id])
    @member = Member.find(current_member.id)
    @reservation = Reservation.new(performance: @performance, member: @member)
    
  end

  def create
    @performance_seat = PerformanceSeat.new(performance_id: params[:performance_id], seat_id: params[:seat_id])
    @movie = Movie.find(params[:movie_id])
    @performance = Performance.find(params[:performance_id])
    @seat = Seat.find(params[:seat_id])
    @member = Member.find(current_member.id)
    @reservation = Reservation.new(performance: @performance, member: @member)
    @kind = Kind.find(params[:kind_id])
    if @performance_seat.save
      if @reservation.save
        @reservation.seats << @seat
        @reservation.kinds << @kind
        redirect_to [@member, :reservations]
      else
        render "new"
      end
    else
      redirect_to "root"
    end

  end
end
