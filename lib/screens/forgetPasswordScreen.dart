// ignore_for_file: prefer_const_constructors, file_names, use_build_context_synchronously

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/screens/SignInScreen.dart';
import 'package:e_shopping_app/shared/snakbar.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordScreen(),
                  ));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                  "assets/images/animations/sammy-line-man-receives-a-mail.png"),
              SizedBox(
                height: 20,
              ),
              Text(
                TTexts.changeYourPasswordTitle,
                style: TTextTheme.lightTextTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.email,
                style: TTextTheme.lightTextTheme.bodyLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    TTexts.changeYourPasswordSubTitle,
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
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Container(
                  height: 68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    TTexts.done,
                    style: TTextTheme.darkTextTheme.bodyLarge,
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: widget.email);
                    if (!mounted) return;
                  } on FirebaseAuthException catch (e) {
                    showSnackBar(context, "ERROR :  ${e.code} ");
                  }
                },
                child: Container(
                  height: 68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(113, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    TTexts.resendEmail,
                    style: TextStyle(
                        color: TColors.primary, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      if (!mounted) return;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                TTexts.forgetPasswordTitle,
                style: TTextTheme.lightTextTheme.headlineMedium,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    TTexts.forgetPasswordSubTitle,
                    textAlign: TextAlign.start,
                    style: TTextTheme.lightTextTheme.bodyMedium,
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (email) {
                  return email!.contains(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                      ? null
                      : "Enter a valid email";
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.email),
                  labelText: TTexts.email,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewPasswordScreen(email: emailController.text),
                        ));
                  } else {
                    showSnackBar(context, "ERROR");
                  }
                },
                child: Container(
                  height: 68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    TTexts.submit,
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
      ),
    ));
  }
}
