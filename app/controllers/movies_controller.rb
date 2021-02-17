class MoviesController < ApplicationController
  # 映画一覧
  def index
    @movies = Movie.order("release_date")
      # .page(params[:page]).per(15)
    @performances = Performance.order("screening_date")
  end

  def search
    @movies = []
    @movies = Movie.all  # タイトル検索(最終版)
      if params[:qtext].present?
        @movies = @movies.where("title LIKE ? ", "%#{params[:qtext]}%")
      end
      if params[:q].present?  # 日付検索(最終版)
        @textmovies = @movies
        @movies = []
        @m = Date.parse(params[:q])
        @textmovies.each do |movie|
          if movie.performances.where("screening_date >= '#{@m}' AND screening_date < '#{@m + 1}'").present?
            @movies.push(movie)
          end
        end
      end
    render "index"
  end

  # 映画情報の詳細
  def show
    @movie = Movie.find(params[:id])
    @performance = Performance.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @movie = Movie.new
    @performance = Performance.new
  end

  # 映画の編集
  def edit
    @movie = Movie.find(params[:id])
  end

  # 映画の新規登録
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to :movies, notice: "映画を登録しました。"
    else
      render "new"
    end
  end

  # 映画情報の更新
  def update
    @movie = Movie.find(params[:id])
    @movie.assign_attributes(params[:movie])
    if @movie.save
      redirect_to :movies, notice: "映画情報を更新しました。"
    else
      render "edit"
    end
  end

  # 映画の削除
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to :movies, notice: "映画を削除しました。"
  end
end
