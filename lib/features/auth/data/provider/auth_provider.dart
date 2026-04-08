import 'package:flutter/material.dart';
import 'package:montra/features/auth/data/models/forgot_password.dart';
import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:montra/features/auth/data/models/sign_up_request.dart';
import 'package:montra/features/auth/data/repositories/auth_repo.dart';
import 'package:montra/features/auth/presentation/pages/forgot_password.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogging = false;
  String? loginerror;
  bool? loginResult;

  bool isSigningUp = false;
  String? signUpError;
  bool? signUpResult;

  bool isSendingEmail = false;
  String? forgotPasswordError;
  bool? forgotPasswordResult;

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

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    isSendingEmail = true;
    forgotPasswordError = null;
    forgotPasswordResult = null;
    notifyListeners();

    try {
      await AuthRepo().forgotPassword(request);
      forgotPasswordResult = true;
    } catch (e) {
      forgotPasswordError = e.toString();
    } finally {
      isSendingEmail = false;
      notifyListeners();
    }
  }
}
