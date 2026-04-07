import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/widgets/primary_button.dart';
import 'package:montra/features/auth/data/provider/validator_passwrod.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController retypepasswordController = TextEditingController();

  bool observeNewPassword = false;
  bool observeRetypePassword = false;

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
      body: Padding(
        padding: const .symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 56),
            TextFormField(
              controller: newpasswordController,
              obscureText: observeNewPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: passwordValidator,
              decoration: InputDecoration(
                hintText: "New password",
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    observeNewPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      observeNewPassword = !observeNewPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: retypepasswordController,
              obscureText: observeRetypePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: passwordValidator,
              decoration: InputDecoration(
                hintText: "Retype new password",
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    observeRetypePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      observeRetypePassword = !observeRetypePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 44),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
