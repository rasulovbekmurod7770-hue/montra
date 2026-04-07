import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/constants/app_fonts.dart';
import 'package:montra/core/widgets/primary_button.dart';
import 'package:montra/features/auth/presentation/pages/login.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const .symmetric(horizontal: 31),
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/email_sent.png")),
            const SizedBox(height: 18),
            Text(
              "Your email is on the way",
              style: TextStyle(fontSize: 24, fontWeight: .w600),
            ),
            const SizedBox(height: 24),
            Text(
              "Check your email test@test.com and \nfollow the instructions to reset your |npassword",
              textAlign: .center,
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
            const SizedBox(height: 190),
            PrimaryButton(
              title: "Back to Login",
              textStyle:  TextStyle(fontSize: 18, fontWeight: .w600, color: Colors.white),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              height: 56,
              width: .infinity,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
