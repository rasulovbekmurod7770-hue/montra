import 'dart:convert';

import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static const String baseUrl = "https://montra-mhys.onrender.com/docs#/";
  Future <void> login (LoginRequest request)async{
     try {
      final response = await http.post(Uri.parse("$baseUrl/login"), 
      headers: {"Content-Type" : "application/json"}, 
      body: jsonEncode(request.toJson())
      );
      print(response.body);
    } catch (e) {
      throw "error $e";
    }
  }
}