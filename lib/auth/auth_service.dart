import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        throw Exception('Username and password are required');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'expiresInMins': 30,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responseData;
      } else {
        throw Exception(responseData['message'] ?? 'Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }
}
