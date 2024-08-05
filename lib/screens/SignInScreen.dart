// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, use_build_context_synchronously, unused_local_variable

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/provider/googleSignin.dart';
import 'package:e_shopping_app/screens/EmailVerificationScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/homeScreen.dart';
import 'package:e_shopping_app/screens/SignUpScreen.dart';
import 'package:e_shopping_app/screens/forgetPasswordScreen.dart';
import 'package:e_shopping_app/shared/snakbar.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordVisible = true;
  bool keepMeLoggedIn  = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //  showSnackBar(context, "Login Successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => EmailVerificationScreen()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }
  }


  
  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("login", keepMeLoggedIn);
  }

  @override
  void dispose() {
  
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Image(
                            height: 130,
                            width: 130,
                            image: AssetImage(TImages.darkAppLogo),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            TTexts.loginTitle,
                            style: TTextTheme.lightTextTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 60,
                            width: 315,
                            child: Text(
                              TTexts.loginSubTitle,
                              style: TTextTheme.lightTextTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
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
                    height: 15,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      prefixIcon: Icon(Icons.password),
                      labelText: TTexts.password,
                    ),
                    obscureText: passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: keepMeLoggedIn , onChanged: (value) {
                          setState(() {
                            keepMeLoggedIn = value!;
                          });
                        },),
                          Text(
                            "Remember Me",
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen(),
                                ));
                          },
                          child: Text("Forgot password?"))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (keepMeLoggedIn == true) {
                        keepUserLoggedIn();
                      }
                      await signIn();
                      if (!mounted) return;
                       
                      // showSnackBar(context, "Done ... ");
                    },
                    child: Container(
                      height: 68,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: TTextTheme.darkTextTheme.bodyLarge,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Container(
                      height: 68,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1.3, color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Create Account",
                        style: TTextTheme.lightTextTheme.bodyLarge,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    TTexts.orSignInWith,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                        await  googleSignInProvider.signInWithGoogle();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Image(
                            image: AssetImage(TImages.google),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: ()async {
                      await  googleSignInProvider.signInWithFacebook();
                      Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Image(
                            image: AssetImage(TImages.facebook),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
