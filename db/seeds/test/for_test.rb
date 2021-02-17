PerformanceSeat.create(
  performance_id: 1,
  seat_id: 1
)

Reservation.create(
  member_id: 1,
  performance_id: 1
)

KindAssignment.create(
  reservation_id: 1,
  kind_id: 1
)

SeatAssignment.create(
  reservation_id: 1,
  seat_id: 1
)
