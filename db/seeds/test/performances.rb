movie = Movie.find(1)
  stime = Time.parse("2021/01/01 12:00:00")
  Performance.create(
    movie: movie,
    screening_date: "2021-01-01",
    start_time: stime,
    end_time: stime+movie.running_time.minute,
    screen: 1
  )
