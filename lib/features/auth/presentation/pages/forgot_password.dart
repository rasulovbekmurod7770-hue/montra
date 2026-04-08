import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/widgets/primary_button.dart';
import 'package:montra/features/auth/data/models/forgot_password.dart';
import 'package:montra/features/auth/data/provider/auth_provider.dart';
import 'package:montra/features/auth/presentation/pages/email_sent.dart';
import 'package:provider/provider.dart';
// import 'package:montra/features/auth/data/models/forgot_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();

  Object? toJson() {}
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Forgot Password",
              style: TextStyle(fontSize: 18, fontWeight: .w600),
            ),
          ),
          body: SingleChildScrollView(
            padding: const .symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const SizedBox(height: 69),
                Text(
                  "Don’t worry. \nEnter your email and we’ll \nsend you a link to reset your \npassword.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: .w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 46),
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
                const SizedBox(height: 32),
                PrimaryButton(
                  title: "Continue",
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: .w600,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  height: 56,
                  width: .infinity,
                  onPressed: () async {
                    final request = ForgotPasswordRequest(
                      email: emailController.text.trim(),
                    );

                    await context.read<AuthProvider>().forgotPassword(request);

                    if (!mounted) return;

                    final error = context
                        .read<AuthProvider>()
                        .forgotPasswordError;
                    if (error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmailSent()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
