class ActiveBooking {
  final String name;
  final String bookingId;
  final String photo;
  final String bookingTime;
  final String address;
  final String amount;

  ActiveBooking({
    required this.name,
    required this.bookingId,
    required this.photo,
    required this.bookingTime,
    required this.address,
    required this.amount,
  });

  factory ActiveBooking.fromJson(Map<String, dynamic> json) {
    return ActiveBooking(
      name: json['name'] ?? '',
      bookingId: json['bookingId'] ?? '',
      photo: json['photo'] ?? '',
      bookingTime: json['bookingTime'] ?? '',
      address: json['address'] ?? '',
      amount: json['amount'] ?? '',
    );
  }
}

class ActiveBookingsResponse {
  final String status;
  final List<ActiveBooking> data;

  ActiveBookingsResponse({
    required this.status,
    required this.data,
  });

  factory ActiveBookingsResponse.fromJson(Map<String, dynamic> json) {
    return ActiveBookingsResponse(
      status: json['status'] ?? '',
      data: (json['data'] as List)
          .map((booking) => ActiveBooking.fromJson(booking))
          .toList(),
    );
  }
}