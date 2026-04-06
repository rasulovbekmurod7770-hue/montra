import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Sign up",
            style: TextStyle(fontSize: 18, fontWeight: .w600),
          ),
        ),
      ),
      body: Padding(
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
            const SizedBox(height: 56),
            TextFormField(
              controller: passwordController,

              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 18, fontWeight: .w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: .circular(16),
                ),
              ),
            ),
            const SizedBox(height: 17,), 
            Row(children: [
              Checkbox(value: isCheck , onChanged:(checkn){} )
            ],)
          ],
        ),
      ),
    );
  }
}
