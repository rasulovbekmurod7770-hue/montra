import 'dart:convert';

import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:montra/features/auth/data/models/sign_up_request.dart';

class AuthRepo {
  static const String baseUrl = "https://montra-mhys.onrender.com/docs#";
  Future <void> login (LoginRequest request)async{
     try {
      final response = await http.post(Uri.parse("$baseUrl/default/login_login_post"), 
      headers: {"Content-Type" : "application/json"}, 
      body: jsonEncode(request.toJson())
      );
      print(response.body);
    } catch (e) {
      throw "error $e";
    }
  }

  Future<void> signUp(SignUpRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/default/register_register_post'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final body = jsonDecode(response.body);
      throw "sign up failed";
    }
  }
}