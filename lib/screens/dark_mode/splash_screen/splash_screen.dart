import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KryptoWalletColor.primaryColor,
      body: Stack(
        children: [
          Image.asset('Ellipse'.toPNG()),
          Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('App_logo'.toPNG(), width: 150),
                  20.vSpace,
                  Text(
                    'CryptoWallet',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
