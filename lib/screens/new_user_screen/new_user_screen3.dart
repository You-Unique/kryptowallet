import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class NewUserScreen3 extends StatelessWidget {
  const NewUserScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KryptoWalletColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('image3'.toPNG(), width: 400)),
            40.vSpace,
            Text(
              'Grow and swap your \ncrypto assets',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            30.vSpace,
            Text(
              'Grow and swap your crypto assets \neffortlessly with the user-friendly features.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
