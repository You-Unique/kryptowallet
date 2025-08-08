import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class NewUserScreen2 extends StatelessWidget {
  const NewUserScreen2({super.key});

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
            Center(child: Image.asset('image2'.toPNG(), width: 400)),
            40.vSpace,
            Text(
              'Transfer your assets \neasily',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            30.vSpace,
            Text(
              'Save your cryptocurrency instantly to your \nwallet!',
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
