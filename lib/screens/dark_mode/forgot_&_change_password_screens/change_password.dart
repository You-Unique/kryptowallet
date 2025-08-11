import 'package:flutter/material.dart';
import 'package:kryptowallet/screens/dark_mode/sign_in_screen/sign_in_screen.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/input_field.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  bool obscureoldpassword = false;
  bool obscurepassword = false;
  bool obscureconfirmpassword = false;
  bool isChecked = false;
  Color fillcolor = KryptoWalletColor.primaryColor;

  @override
  void dispose() {
    _password.dispose();
    _oldpassword.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: fillcolor,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                40.vSpace,
                InputField(
                  textEditingController: _oldpassword,
                  fillcolor: fillcolor,
                  label: 'Old Password',
                  hint: '********',
                  hintsize: 20,
                  obscure: obscureoldpassword,
                  bordercolor: KryptoWalletColor2.primaryColor,
                  suffixWidget: GestureDetector(
                    child: obscureoldpassword == true
                        ? const Icon(Icons.visibility_off_outlined, size: 30)
                        : const Icon(Icons.visibility_outlined, size: 30),
                    onTap: () => setState(() {
                      obscureoldpassword = !obscureoldpassword;
                    }),
                  ),
                ),
                40.vSpace,
                InputField(
                  textEditingController: _password,
                  fillcolor: fillcolor,
                  label: 'New Password',
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
                40.vSpace,
                InputField(
                  textEditingController: _confirmpassword,
                  fillcolor: fillcolor,
                  label: 'Comfirm Password',
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
                60.vSpace,
                Button(
                  buttonName: 'Change Password',
                  fontsize: 20,
                  onTap: () {
                    // First show the bottom sheet
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: ScreenSizes.height(context) * 0.2,
                        width: ScreenSizes.width(context),
                        color: KryptoWalletColor.primaryColor,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            40.vSpace,
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: KryptoWalletColor2.primaryColor,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            20.vSpace,
                            const Text(
                              "Your password has been changed",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).then((_) {
                      // This executes when the bottom sheet is dismissed
                      // But we want navigation while it's still visible
                    });

                    // Add delay before navigation
                    Future.delayed(const Duration(seconds: 1), () {
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      }
                    });
                  },
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
                      Icon(Icons.cancel_outlined, color: Colors.white),
                      5.hSpace,
                      Text(
                        'Cancel',
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
