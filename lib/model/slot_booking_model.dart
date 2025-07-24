class BookingSlot {
  final String date;
  final String timeSlot;
  final String id;

  BookingSlot({
    required this.date,
    required this.timeSlot,
    required this.id,
  });

  factory BookingSlot.fromJson(Map<String, dynamic> json) {
    return BookingSlot(
      date: json['date'],
      timeSlot: json['timeSlot'],
      id: json['_id'],
    );
  }
}
