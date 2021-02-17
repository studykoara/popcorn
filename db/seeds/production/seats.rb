en = ('A'..'Z').to_a
  0.upto(9) do |idx2|
    1.upto(15) do |idx3|
      Seat.create(
        en_number: en[idx2],
        number: idx3
      )
    end
  end
