import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final double height;
  final double width;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    this.textStyle,
    required this.height,
    required this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          elevation: 0,
        ),

        child: Text(title, style: textStyle),
      ),
    );
  }
}
