import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/widgets/primary_button.dart';
import 'package:montra/features/auth/data/models/login_request.dart';
import 'package:montra/features/auth/data/provider/auth_provider.dart';
import 'package:montra/features/auth/data/provider/validator_passwrod.dart';
import 'package:montra/features/auth/presentation/pages/forgot_password.dart';
import 'package:montra/features/auth/presentation/pages/sign_up.dart';
import 'package:montra/features/home/presentation/pages/home.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool observePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Login", style: TextStyle(fontSize: 18, fontWeight: .w600)),
      ),
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 56),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 18, fontWeight: .w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: .circular(16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: passwordController,
              obscureText: observePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: passwordValidator,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    observePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      observePassword = !observePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),

            Consumer<AuthProvider>(
              builder: (context, provider, _) {
                return PrimaryButton(
                  title: "Login",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: .w600,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  height: 56,
                  width: .infinity,
                  onPressed: () async {
                    final request = LoginRequest(
                      password: passwordController.text.trim(),
                      email: emailController.text.trim(),
                    );

                    await context.read<AuthProvider>().login(request);

                    if (!mounted) return;

                    final error = context.read<AuthProvider>().loginerror;
                    if (error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                       Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Home()),
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 33),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 38),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Don’t have an account yet? ",
                  style: TextStyle(fontSize: 16, fontWeight: .w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
