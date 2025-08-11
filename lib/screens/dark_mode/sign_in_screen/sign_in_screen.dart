import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kryptowallet/google/google_sign_in_button.dart';
import 'package:kryptowallet/screens/dark_mode/forgot_&_change_password_screens/change_password.dart';
import 'package:kryptowallet/screens/dark_mode/forgot_&_change_password_screens/forgot_password.dart';
import 'package:kryptowallet/screens/dark_mode/sign_up_screen/sign_up_screen.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/input_field.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Color? _containerColor;

  bool obscurepassword = false;
  bool isChecked = false;
  Color fillcolor = KryptoWalletColor.primaryColor;

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
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
              text: 'Don\'t have an account? ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: ' Sign Up',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
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
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 34,
                  ),
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
                40.vSpace,
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
                10.vSpace,
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
                      'Remember Me',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: KryptoWalletColor2.primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPassword();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                60.vSpace,
                Button(
                  buttonName: 'Login',
                  fontsize: 20,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangePassword();
                      },
                    ),
                  ),
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
                GoogleSignInButton(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
