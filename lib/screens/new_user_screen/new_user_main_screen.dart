import 'package:flutter/material.dart';
import 'package:kryptowallet/screens/new_user_screen/new_user_screen1.dart';
import 'package:kryptowallet/screens/new_user_screen/new_user_screen2.dart';
import 'package:kryptowallet/screens/new_user_screen/new_user_screen3.dart';
import 'package:kryptowallet/screens/sign_up_screen/sign_up_screen.dart';
import 'package:kryptowallet/shared_utils/button.dart';
import 'package:kryptowallet/shared_utils/extension.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';
import 'package:kryptowallet/shared_utils/screen_sizes.dart';

class NewUserMainScreen extends StatefulWidget {
  const NewUserMainScreen({super.key});

  @override
  State<NewUserMainScreen> createState() => _NewUserMainScreenState();
}

class _NewUserMainScreenState extends State<NewUserMainScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 2) {
      // Move to the next page in the PageView
      _pageController.nextPage(
        duration: const Duration(
          milliseconds: 300,
        ), // Duration of the page transition
        curve: Curves.easeInOut, // for the pages transitioning
      );
    } else {
      // this check if its on the last page and remove all the remaining screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const NewUserScreen3()),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screenPages = <Widget>[
      NewUserScreen1(),
      NewUserScreen2(),
      NewUserScreen3(),
    ];

    return Scaffold(
      backgroundColor: KryptoWalletColor.primaryColor,
      bottomNavigationBar: SizedBox(
        width: ScreenSizes.width(context),
        height: ScreenSizes.height(context) * 0.25,
        child: Column(
          children: [
            10.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: index == currentIndex ? 40 : 10,
                    height: 8,
                    decoration: index == currentIndex
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: KryptoWalletColor2.primaryColor,
                          )
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
            60.vSpace,
            Button(
              width: ScreenSizes.width(context) * 0.7,
              height: 60,
              buttonName: currentIndex == 2 ? 'Get Started' : 'Next',
              fontsize: 20,
              onTap: () {
                currentIndex == 2
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      )
                    : nextPage();
              },
              buttonColor: KryptoWalletColor2.primaryColor,
            ),
            20.vSpace,
            currentIndex == 2
                ? SizedBox.shrink()
                : GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        2, // The index you want to skip to
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: Expanded(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() {
            currentIndex = index;
          }),
          children: screenPages,
        ),
      ),
    );
  }
}
