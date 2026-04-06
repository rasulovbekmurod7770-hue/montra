import 'package:flutter/material.dart';
import 'package:montra/core/constants/app_colors.dart';
import 'package:montra/core/constants/app_fonts.dart';
import 'package:montra/core/widgets/primary_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const .symmetric(horizontal: 31),
        child: Column(
          children: [
            const SizedBox(height: 21,), // in design height is 32 but because my device's screen is small i used 21 here 
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/Illustration1.png"),
                      ),
                      const SizedBox(height: 41),
                      Text(
                        "Gain total control \nof your money",
                        style: AppFonts.primaryFontAuth,
                        textAlign: .center,
                      ),
                      const SizedBox(height: 17),
                      Text(
                        "Become your own money manager \nand make every cent count",
                        style: AppFonts.secondaryFont,
                        textAlign: .center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/Illustration2.png"),
                      ),
                      const SizedBox(height: 41),
                      Text(
                        "Know where your \nmoney goes",
                        style: AppFonts.primaryFontAuth,
                        textAlign: .center,
                      ),
                      const SizedBox(height: 17),
                      Text(
                        "Track your transaction easily, \nwith categories and financial report ",
                        style: AppFonts.secondaryFont,
                        textAlign: .center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/Illustration.png"),
                      ),
                      const SizedBox(height: 41),
                      Text(
                        "Planning ahead",
                        style: AppFonts.primaryFontAuth,
                        textAlign: .center,
                      ),
                      const SizedBox(height: 17),
                      Text(
                        "Setup your budget for each category \nso you in control",
                        style: AppFonts.secondaryFont,
                        textAlign: .center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 31),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            SizedBox(height: 33),
            PrimaryButton(
              onPressed: () {},
              title: "Sign Up",
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              height: 56,
              width: .infinity,
              textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: .w600),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: "Login",
              backgroundColor: AppColors.secondaryColor,
              height: 56,
              width: .infinity,
              foregroundColor: AppColors.secondaryColor,
              textStyle: TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: .w600),
            ),
            const SizedBox(height: 8,), 
          ],
        ),
      ),
    );
  }
}
