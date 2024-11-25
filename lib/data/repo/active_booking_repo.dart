import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/active_booking_model.dart';

class ActiveBookingRepository {
  final String _baseUrl = 'https://dummyjson.com/c/0757-45f7-4d95-b956';

  Future<List<ActiveBooking>> fetchActiveBookings() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      
      if (response.statusCode == 200) {
        final parsedResponse = ActiveBookingsResponse.fromJson(
          jsonDecode(response.body),
        );
        return parsedResponse.data;
      } else {
        throw Exception('Failed to load active bookings');
      }
    } catch (e) {
      throw Exception('Error fetching active bookings: $e');
    }
  }
}