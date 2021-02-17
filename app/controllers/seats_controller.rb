class SeatsController < ApplicationController
  def index
    @seats = Seat.all
    @movie = Movie.find(params[:movie_id])
    @performance = Performance.find(params[:performance_id])
    @reserved = PerformanceSeat.where(performance_id: params[:performance_id])
  end
end
