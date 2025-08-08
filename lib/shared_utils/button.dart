import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final Color buttonColor;
  final double? width;
  final double height;
  final double? fontsize;
  const Button({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.buttonColor,
    required this.height,
    this.width,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? ScreenSizes.width(context),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}
