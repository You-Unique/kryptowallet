import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kryptowallet/google/google_sign_up_button.dart';
import 'package:kryptowallet/screens/dark_mode/sign_in_screen/sign_in_screen.dart';
import 'package:kryptowallet/screens/dark_mode/sign_up_screen/email_authentication_screen.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/input_field.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  Color? _containerColor;

  bool obscurepassword = false;
  bool obscureconfirmpassword = false;
  bool isChecked = false;
  Color fillcolor = KryptoWalletColor.primaryColor;

  @override
  void dispose() {
    _password.dispose();
    _fullName.dispose();
    _email.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  void rememberMeColour() {
    setState(() {
      _containerColor = _containerColor == null
          ? KryptoWalletColor2.primaryColor
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: KryptoWalletColor.primaryColor,
        bottomNavigationBar: SafeArea(
          bottom: true,
          minimum: const EdgeInsets.only(bottom: 60),
          child: Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: ' Login',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    },
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: KryptoWalletColor2.primaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.vSpace,
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                30.vSpace,
                InputField(
                  textEditingController: _fullName,
                  label: 'Full Name',
                  fillcolor: fillcolor,
                  hint: 'John Doe',
                  hintsize: 20,
                  bordercolor: KryptoWalletColor2.primaryColor,
                ),
                30.vSpace,
                InputField(
                  textEditingController: _email,
                  label: 'Email',
                  fillcolor: fillcolor,
                  hint: 'example@yourmail.com',
                  hintsize: 20,
                  bordercolor: KryptoWalletColor2.primaryColor,
                ),
                30.vSpace,
                InputField(
                  textEditingController: _password,
                  fillcolor: KryptoWalletColor.primaryColor,
                  label: 'Password',
                  hint: '********',
                  hintsize: 20,
                  obscure: obscurepassword,
                  bordercolor: KryptoWalletColor2.primaryColor,
                  suffixWidget: GestureDetector(
                    child: obscurepassword == true
                        ? const Icon(Icons.visibility_off_outlined, size: 30)
                        : const Icon(Icons.visibility_outlined, size: 30),
                    onTap: () => setState(() {
                      obscurepassword = !obscurepassword;
                    }),
                  ),
                ),
                30.vSpace,
                InputField(
                  textEditingController: _confirmpassword,
                  fillcolor: KryptoWalletColor.primaryColor,
                  label: 'Confirm Password',
                  hint: '********',
                  hintsize: 20,
                  obscure: obscureconfirmpassword,
                  bordercolor: KryptoWalletColor2.primaryColor,
                  suffixWidget: GestureDetector(
                    child: obscureconfirmpassword == true
                        ? const Icon(Icons.visibility_off_outlined, size: 30)
                        : const Icon(Icons.visibility_outlined, size: 30),
                    onTap: () => setState(() {
                      obscureconfirmpassword = !obscureconfirmpassword;
                    }),
                  ),
                ),
                20.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: _containerColor != null
                              ? null
                              : Border.all(
                                  color: KryptoWalletColor2.primaryColor,
                                ),
                          color: _containerColor,
                        ),
                        child: _containerColor == null
                            ? null
                            : const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      onTap: () {
                        rememberMeColour();
                      },
                    ),
                    10.hSpace,
                    const Text(
                      'I agree with Terms and Privacy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                30.vSpace,
                Button(
                  buttonName: 'Sign Up',
                  fontsize: 20,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EmailAuthenticationScreen();
                        },
                      ),
                    );
                  },
                  buttonColor: KryptoWalletColor2.primaryColor,
                  height: 70,
                  width: ScreenSizes.width(context),
                ),
                20.vSpace,
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                20.vSpace,
                GoogleSignUpButton(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
