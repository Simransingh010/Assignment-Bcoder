import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wallet_model.dart';

class WalletRepository {
  final String _baseUrl = 'https://dummyjson.com/c/9bae-6313-4ea4-91a3';

  Future<WalletResponse> fetchWalletData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      
      if (response.statusCode == 200) {
        return WalletResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load wallet data');
      }
    } catch (e) {
      throw Exception('Error fetching wallet data: $e');
    }
  }
} 