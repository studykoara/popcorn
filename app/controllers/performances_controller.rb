class PerformancesController < ApplicationController
  # 上映一覧
  def index
    @movie = Movie.find(params[:movie_id])
    @performances = @movie.performances
    @performance = Performance.new(params[:performance])
  end

  # 上映作成
  def create
    @performance = Performance.new(params[:performance])
    @performance.movie = Movie.find(params[:movie_id])
    # @e_time = @start_time + @performance.movie.running_time
    # performances.assign_attributes(end_time: @e_time)
    if @performance.save
      redirect_back(fallback_location: root_path)
    else
      @movie = Movie.find(params[:movie_id])
      @performance.movie = @movie
      @performances = @movie.performances
      render action: :index
    end
  end

  # 上映削除
  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    redirect_back(fallback_location: root_path)
  end
end
