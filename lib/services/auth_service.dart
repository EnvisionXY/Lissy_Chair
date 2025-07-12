import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_model.dart';

class AuthService {
  final String baseUrl = 'https://reqres.in/api';

  // Login method
  Future<AuthModel?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data, email); // Create AuthModel from response
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['error']); // Throw the error message
    }
  }

  // Sign-up method
  Future<AuthModel?> signUp(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data, email); // Create AuthModel from response
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['error']); // Throw the error message
    }
  }
}
