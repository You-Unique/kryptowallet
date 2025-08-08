import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class GoogleSignUpButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleSignUpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: KryptoWalletColor2.primaryColor, width: 2),
          // color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Google'.toPNG(), width: 24, height: 24),
              10.hSpace,
              const Text(
                'Sign up With Google',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
