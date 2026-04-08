
import 'package:flutter/material.dart';
import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:montra/features/auth/data/models/sign_up_request.dart';
import 'package:montra/features/auth/data/repositories/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogging = false;
  String? loginerror;
  bool? loginResult;

  bool isSigningUp = false;
  String? signUpError;
  bool? signUpResult;

  Future<void> login(LoginRequest request) async {
    isLogging = true;
    loginerror = null;
    loginResult = null;
    notifyListeners();
    try {
      await AuthRepo().login(request);
      loginResult = true;
    } catch (e) {
      loginerror = e.toString();
    } finally {
      isLogging = false;

      notifyListeners();
    }
  }

  Future<void> signUp(SignUpRequest request) async {
    isSigningUp = true;
    signUpError = null;
    signUpResult = null;
    notifyListeners();

    try {
      await AuthRepo().signUp(request);
      signUpResult = true;
    } catch (e) {
      signUpError = e.toString();
    } finally {
      isSigningUp = false;
      notifyListeners();
    }
  }
}
