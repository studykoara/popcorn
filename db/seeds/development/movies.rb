titles = %w(月曜のmoon 火曜のfire 水曜のwater 木曜のtree 金曜のmoney 土曜のsoil 日曜のsun)
stories = %w(月曜のお話。 火曜のお話。 水曜のお話。 木曜のお話 金曜のお話 土曜のお話 日曜のお話。)
times = [90,95,120,125]
distributions = %w(東映 東宝 東洋フィルム会社 日本アート・シアター・ギルド 日本シネマ)
director = %w(美弥咲隼男 スティーヴン・スピルバーグ 外崎春雄 北野武)
actors = %w(佐藤修 鈴木賢人 高橋花子 田中美紀 滑大郎)
0.upto(6) do |idx|
  Movie.create(
    title: titles[idx],
    story: stories[idx],
    release_date: "2021-01-25",
    running_time: "#{times[idx%4]}",
    distribution: "#{distributions[idx%5]}",
    director: "#{director[idx%4]}",
    actor: "#{actors[idx%5]} #{actors[(idx+1)%5]}"
  )
end
