row = %w(A B C D E F G H)
srow = %w(C D E F G H)

1.upto(2) do |n|
    srow.each do |e| 
        Seat.create(
            en_number: e,
            number: n
        )
    end
end

3.upto(12) do |n|
    row.each do |e|
        Seat.create(
            en_number: e,
            number: n
        )
    end
end

13.upto(14) do |n|
    srow.each do |e|
        Seat.create(
            en_number: e,
            number: n
        )
    end
end   