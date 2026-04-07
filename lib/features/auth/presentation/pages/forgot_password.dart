import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/widgets/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              textStyle: TextStyle(fontSize: 18, fontWeight: .w600, color: Colors.white),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              height: 56,
              width: .infinity,
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
