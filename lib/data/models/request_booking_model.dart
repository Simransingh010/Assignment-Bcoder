class RequestBooking {
  final String name;
  final String bookingId;
  final String photo;
  final String bookingTime;
  final String address;
  final String amount;

  RequestBooking({
    required this.name,
    required this.bookingId,
    required this.photo,
    required this.bookingTime,
    required this.address,
    required this.amount,
  });

  factory RequestBooking.fromJson(Map<String, dynamic> json) {
    return RequestBooking(
      name: json['name'] ?? '',
      bookingId: json['bookingId'] ?? '',
      photo: json['photo'] ?? '',
      bookingTime: json['bookingTime'] ?? '',
      address: json['address'] ?? '',
      amount: json['amount'] ?? '',
    );
  }
}