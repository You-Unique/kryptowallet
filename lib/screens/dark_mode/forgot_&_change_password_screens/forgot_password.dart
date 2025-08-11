import 'package:flutter/material.dart';
import 'package:kryptowallet/screens/dark_mode/sign_up_screen/email_authentication_screen.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/input_field.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();
  Color fillcolor = KryptoWalletColor.primaryColor;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: KryptoWalletColor.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                10.vSpace,
                Text(
                  'Please enter your email below to receive instructions on how to reset your password',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                40.vSpace,
                InputField(
                  textEditingController: _email,
                  label: 'Email',
                  fillcolor: fillcolor,
                  hint: 'example@yourmail.com',
                  hintsize: 20,
                  bordercolor: KryptoWalletColor2.primaryColor,
                ),
                20.vSpace,
                Button(
                  buttonName: 'Reset Password',
                  fontsize: 20,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return EmailAuthenticationScreen();
                      },
                    ),
                  ),
                  buttonColor: KryptoWalletColor2.primaryColor,
                  height: 70,
                  width: ScreenSizes.width(context),
                ),
                20.vSpace,
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      5.hSpace,
                      Text(
                        'Back to Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
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
