import 'dart:convert';

import 'package:montra/features/auth/data/models/forgot_password.dart';
import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:montra/features/auth/data/models/sign_up_request.dart';
import 'package:montra/features/auth/presentation/pages/forgot_password.dart';

class AuthRepo {
  static const String baseUrl = "https://montra-mhys.onrender.com/docs#";
  Future<void> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/default/login_login_post"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
      print(response.body);
    } catch (e) {
      throw "error $e";
    }
  }

  Future<void> signUp(SignUpRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/default/register_register_post'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final body = jsonDecode(response.body);
        throw "nooo";
      }
    } catch (e) {
      throw "erroe $e";
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(
          '$baseUrl/default/forgot_password_forgot_password_post',
        ), 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final body = jsonDecode(response.body);
        throw 'Email not found';
      }
    } catch (e) {
      throw "error $e";
    }
  }
}
