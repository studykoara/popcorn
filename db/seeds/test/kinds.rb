kind_name = %w{一般 大学生・高校生 幼児・小中学生 シニア}
fee = %w{¥2,000 ¥1,800 ¥1,300 ¥1,300}

kind_name.each do |k|
  fee.each do |f| 
      Kind.create(
          kind_name: k,
          fee: f
      )
  end
end