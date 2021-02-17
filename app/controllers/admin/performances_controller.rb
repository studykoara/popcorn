class Admin::PerformancesController < Admin::Base
  # 上映一覧
  def index
    @movie = Movie.find(params[:movie_id])
    @performances = @movie.performances
    @performance = Performance.new(params[:performance])
  end

  # 上映作成
  def create
    # @performance = Performance.new(params[:performance])
    @performance = Performance.new(performance_params)
    @movie = Movie.find(params[:movie_id])
    # @performance.start_time = params[:start_time]
    @performance[:end_time] = @performance.start_time + @movie.running_time.minute
    @performance.movie = @movie
    # @e_time = @start_time + @performance.movie.running_time
    # performances.assign_attributes(end_time: @e_time)
    if @performance.save
      redirect_back(fallback_location: root_path)
      flash[:notive] = "can't before release date"
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
  
  private def performance_params
    params.require(:performance)
  end
end
