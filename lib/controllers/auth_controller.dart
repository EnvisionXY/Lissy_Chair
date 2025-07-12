import '../models/auth_model.dart';
import '../services/auth_service.dart';

class AuthController {
  final AuthService authService = AuthService();

  // Login logic
  Future<AuthModel?> login(String email, String password) async {
    try {
      return await authService.login(email, password); // Return AuthModel
    } catch (error) {
      rethrow; // Pass error back to the View
    }
  }

  // Sign-up logic
  Future<AuthModel?> signUp(String email, String password) async {
    try {
      return await authService.signUp(email, password); // Return AuthModel
    } catch (error) {
      rethrow; // Pass error back to the View
    }
  }
}
