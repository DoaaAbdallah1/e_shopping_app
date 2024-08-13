// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, use_build_context_synchronously

import 'dart:async';

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/screens/Home%20pages/homeScreen.dart';
import 'package:e_shopping_app/screens/SignInScreen.dart';
import 'package:e_shopping_app/shared/snakbar.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        // when we click on the link that existed on yahoo
        await FirebaseAuth.instance.currentUser!.reload();

        // is email verified or not (clicked on the link or not) (true or false)
        setState(() {
          isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        });

        if (isEmailVerified) {
          timer.cancel();
        }
      });
    }
  }

  sendVerificationEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      showSnackBar(context, "ERROR => ${e.toString()}");
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? HomeScreen()
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                        "assets/images/animations/sammy-line-man-receives-a-mail.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      TTexts.confirmEmail,
                      style: TTextTheme.lightTextTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: TTextTheme.lightTextTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Text(
                          TTexts.confirmEmailSubTitle,
                          textAlign: TextAlign.center,
                          style: TTextTheme.lightTextTheme.bodyMedium,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 68,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: GestureDetector(
                        onTap: () {
                          canResendEmail ? sendVerificationEmail() : null;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(8, 0, 0, 0),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            TTexts.resendEmail,
                            style: TextStyle(
                                color: TColors.primary,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
}

class CreateAccountSuccessfully extends StatefulWidget {
  const CreateAccountSuccessfully({super.key});

  @override
  State<CreateAccountSuccessfully> createState() =>
      _CreateAccountSuccessfullyState();
}

class _CreateAccountSuccessfullyState extends State<CreateAccountSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(TImages.staticSuccessIllustration),
            SizedBox(
              height: 20,
            ),
            Text(
              TTexts.yourAccountCreatedTitle,
              style: TTextTheme.lightTextTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 90,
                width: double.infinity,
                child: Text(
                  TTexts.yourAccountCreatedSubTitle,
                  textAlign: TextAlign.center,
                  style: TTextTheme.lightTextTheme.bodyMedium,
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Container(
                height: 68,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text(
                  TTexts.tContinue,
                  style: TTextTheme.darkTextTheme.bodyLarge,
                )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}
