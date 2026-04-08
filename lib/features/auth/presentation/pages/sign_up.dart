import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/widgets/primary_button.dart';
import 'package:montra/features/auth/data/models/sign_up_request.dart';
import 'package:montra/features/auth/data/provider/auth_provider.dart';
import 'package:montra/features/auth/data/provider/validator_passwrod.dart';
import 'package:montra/features/auth/presentation/pages/login.dart';
import 'package:montra/features/home/presentation/pages/home.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;
  bool observePassword = true;

   @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Sign up",
          style: TextStyle(fontSize: 18, fontWeight: .w600),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        padding: const .symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 56),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(fontSize: 18, fontWeight: .w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: .circular(16),
                ),
              ),
            ),
            const SizedBox(height: 24),
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

            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,
                  value: isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheck = value!;
                    });
                  },
                ),

                Text(
                  "By signing up, you agree to the Terms of \nService and Privacy Policy",
                  style: TextStyle(fontSize: 14, fontWeight: .w500),
                ),
              ],
            ),
            const SizedBox(height: 27),
            PrimaryButton(
              title: "Sign up",
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
                    final request = SignUpRequest(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    await context.read<AuthProvider>().signUp(request);

                    if (!mounted) return;

                    final error = context.read<AuthProvider>().signUpError;
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
            ),
            const SizedBox(height: 12),
            Text(
              "Or with",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w700,
                color: Color(0xFF91919F),
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const .symmetric(horizontal: 62),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: .all(width: 1, color: Colors.black),
                  borderRadius: .circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.facebook, size: 32),
                    Text(
                      "Sign Up with Facebook",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16, fontWeight: .w500),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Login",
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
