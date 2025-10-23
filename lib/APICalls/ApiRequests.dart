import 'package:ticksy/Models/SignUpReq.dart';

import 'package:http/http.dart' as http;
import 'package:ticksy/Models/loginReq.dart';

class ApiRequests {
  final String baseUrl = 'http://192.168.1.4:8080';

  Future<void> signup(SignUpReq request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: request.toRawJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Signup successful');
      print(response.body);
    } else {
      print('Signup failed: ${response.statusCode}');
      print(response.body);
    }
  }

  Future<void> login(LoginReq request) async {
    // Implement login API call here
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: request.toRawJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Login successful');
      print(response.body);
    } else {
      print('Login failed: ${response.statusCode}');
      print(response.body);
    }
  }
}
