import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request_booking_model.dart';

class RequestBookingRepository {
  final String baseUrl = 'https://dummyjson.com/c/d483-5624-4256-8daf';

  Future<RequestBooking> fetchActiveBooking() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 'success') {
          final booking = RequestBooking.fromJson(jsonData['data']);
          print('Parsed booking: $booking');
          return booking;
        }
        throw Exception('Data fetch failed');
      }
      throw Exception('Failed to load active booking');
    } catch (e) {
      print('Error in repository: $e');
      throw Exception('Error fetching active booking: $e');
    }
  }
}
