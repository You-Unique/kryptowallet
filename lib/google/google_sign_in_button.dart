import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class GoogleSignInButton extends StatefulWidget {
  final VoidCallback onTap;

  const GoogleSignInButton({super.key, required this.onTap});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool googleBorder = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => googleBorder = true),
        onExit: (_) => setState(() => googleBorder = false),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: KryptoWalletColor2.primaryColor,
              width: 2,
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: const [BoxShadow(color: Colors.white)],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Google'.toPNG(), width: 24, height: 24),
                10.hSpace,
                const Text(
                  'Login With Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
