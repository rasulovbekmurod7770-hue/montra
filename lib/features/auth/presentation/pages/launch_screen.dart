import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Container(
          margin: const .only(left: 160, right: 100),
          height: 200,
          width: .infinity,
          child: Stack(
            children: [
              Image(image: AssetImage("assets/images/Ellipse38.png")),
              Positioned(
                top: 20,
                left: 10,
                width: 200,
                child: Text(
                  "montra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: .w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
