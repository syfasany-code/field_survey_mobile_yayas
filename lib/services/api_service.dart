import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://sijala.biz.id/api/v1';
  static Future<Map<String, dynamic>> register({
      required String name,
      required String email,
      required String password,
      String? phone,
      String? gender,
    }) async {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'phone': phone ?? '',
          'gender': gender ?? '',
        },
      );

      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return data;
      } else {
        if (data['errors'] != null) {
          throw Exception(data['errors'].toString());
        }
        throw Exception(data['message'] ?? 'Register gagal');
      }
    }

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    print("LOGIN RESPONSE: $data");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Email atau password salah');
    }
  }

  static Future<Map<String, dynamic>> getProfile(String token) async {
    print("TOKEN KE PROFILE: $token");

    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    final data = jsonDecode(response.body);
    print("PROFILE RESPONSE: $data");

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Token tidak valid');
    }
  }

  static Future<Map<String, dynamic>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String birth_place,
    required String birth_date,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/profile'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "birth_place": birth_place,
        "birth_date": birth_date,
      },
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception("ERROR: ${response.statusCode} - ${response.body}");
    }
  }

  static Future<void> logout(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("LOGOUT STATUS: ${response.statusCode}");
    print("LOGOUT BODY: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Gagal logout dari server");
    }
  }
}