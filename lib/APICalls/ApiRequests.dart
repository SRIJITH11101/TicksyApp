import 'dart:convert';

import 'package:ticksy/Models/AuthRes.dart';
import 'package:ticksy/Models/Message.dart';
import 'package:ticksy/Models/SignUpReq.dart';

import 'package:http/http.dart' as http;
import 'package:ticksy/Models/Ticket.dart';
import 'package:ticksy/Models/TicketReq.dart';
import 'package:ticksy/Models/loginReq.dart';

class ApiRequests {
  final String baseUrl = 'http://172.18.162.144:8080';

  Future<AuthRes?> signup(SignUpReq request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register'),
      headers: {'Content-Type': 'application/json'},

      body: request.toRawJson(),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return AuthRes.fromJson(jsonResponse);
    } else {
      print('SignUp failed: ${response.statusCode}');
      print(response.body);
      return null; // or throw an exception
    }
  }

  Future<AuthRes?> login(LoginReq request) async {
    // Implement login API call here
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: request.toRawJson(),
    );

    if (response.statusCode == 200) {
      print('Login successful' + response.body);
      final jsonResponse = jsonDecode(response.body);
      return AuthRes.fromJson(jsonResponse);
    } else {
      print('Login failed: ${response.statusCode}');
      print(response.body);
      return null; // or throw an exception
    }
  }

  Future<List<Ticket>> fetchUserTickets(
    String userId,
    String accessToken,
  ) async {
    final url = Uri.parse('$baseUrl/api/tickets/user?userId=$userId');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Ticket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tickets: ${response.statusCode}');
    }
  }

  Future<List<Message>> getMessagesByTicketId(
    String ticketId,
    String accessToken,
  ) async {
    final url = Uri.parse('$baseUrl/api/messages/fetch?ticketId=$ticketId');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken', // add if required
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Message.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  }

  Future<void> createTicket(TicketReq ticketReq, String accessToken) async {
    // 🧩 Debug print to check your request data
    print('🟢 Sending ticket request: ${ticketReq.toRawJson()}');

    final response = await http.post(
      Uri.parse('$baseUrl/api/tickets/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: ticketReq.toRawJson(),
    );

    print('🔵 Response status: ${response.statusCode}');
    print('🔵 Response body: ${response.body}');

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to create ticket: ${response.body}');
    }
  }
}
