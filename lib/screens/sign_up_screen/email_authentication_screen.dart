import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/pin_input_widget.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class EmailAuthenticationScreen extends StatefulWidget {
  const EmailAuthenticationScreen({super.key});

  @override
  State<EmailAuthenticationScreen> createState() =>
      _EmailAuthenticationScreenState();
}

class _EmailAuthenticationScreenState extends State<EmailAuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: KryptoWalletColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Confirm your Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
              20.vSpace,
              Text(
                'We have sent a confirmation email to the address',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                'example@yourmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              40.vSpace,
              PinInputWidget(),
              80.vSpace,
              Button(
                buttonName: 'Confirm',
                onTap: () {},
                buttonColor: KryptoWalletColor2.primaryColor,
                fontsize: 20,
                height: 70,
                width: ScreenSizes.width(context),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: Colors.white),
                  5.hSpace,
                  Text(
                    '01:00',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
