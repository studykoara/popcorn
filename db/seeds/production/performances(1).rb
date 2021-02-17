time = Time.parse("2021/01/25 00:00:00")
# movie = Movie.find(1)
#   Performance.create(
#     movie: movie,
#     screening_date: "2021-01-01",
#     start_time: stime,
#     end_time: stime+movie.running_time.minute,
#     screen: 1
#   )

0.upto(6) do |i|
  0.upto(2) do |idx|
    movie = Movie.find(i+1)
    stime = time + (60*60*3*idx)
    Performance.create(
      movie: movie,
      screening_date: "2021-01-#{idx+25}",
      start_time: stime,
      end_time: stime+movie.running_time.minute,
      screen: "#{Random.rand(1..6)}"
    )
  end
end
