// ignore_for_file: prefer_const_constructors, file_names, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/provider/googleSignin.dart';
import 'package:e_shopping_app/screens/EmailVerificationScreen.dart';
import 'package:e_shopping_app/screens/SignInScreen.dart';
import 'package:e_shopping_app/shared/snakbar.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisible = true;
  bool value = false;


  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();

  bool isPassword8Char = false;
  bool isPasswordHas1Number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      CollectionReference users =
          FirebaseFirestore.instance.collection('usersss');

      users
          .doc(credential.user!.uid)
          .set({
            
            'first_name': firstNameController.text, 
            'last_name': lastNameController.text,
            'phone_number': phoneNumberController.text,
            'username': userNameController.text,
            'email': emailController.text,
            "password": passwordController.text,
            "imgURL":  'https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg'
          
          })
          .then((value) => print("User Added"))
          
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The account already exists for that email.");
      } else {
        showSnackBar(context, "ERROR - Please try again late");
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    
    emailController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void onChanged(bool? value) {
    setState(() {
      this.value = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        TTexts.signupTitle,
                        style: TTextTheme.lightTextTheme.headlineMedium,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        //width: 182,
                        child: TextFormField(
                          controller: firstNameController,
                          validator: (value) {
                            return value!.length < 3
                                ? 'Name must be more than 2 charater'
                                : null;
                          },
                          onSaved: (newValue) {
                          
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.person),
                            labelText: TTexts.firstName,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        //width: 182,
                        child: TextFormField(
                          controller: lastNameController,
                          validator: (value) {
                            return value!.length < 3
                                ? 'Name must be more than 2 charater'
                                : null;
                          },
                          onSaved: (newValue) {
                            //_lastName = newValue;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.person),
                            labelText: TTexts.lastName,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: userNameController,
                    validator: (value) {
                      return value!.length < 3
                          ? 'Name must be more than 2 charater'
                          : null;
                    },
                    onSaved: (newValue) {
                    //  _username = newValue;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: TTexts.username,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    // we return "null" when something is valid
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    validator: (value) {
                      return (value!.length != 11)
                          ? 'Mobile Number must be of 11 digit'
                          : null;
                    },
                    onSaved: (newValue) {
                      //_mobile = newValue;

                      //  FirebaseAuth.instance.currentUser!.phoneNumber!.replaceAll("", newValue!) ;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.phone),
                      labelText: TTexts.phoneNo,
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (password) {
                      onPasswordChanged(password);
                    },
                    // we return "null" when something is valid
                    validator: (value) {
                      return value!.length < 8
                          ? "Enter at least 8 characters"
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          Checkbox(value: value, onChanged: onChanged),
                          Text(
                            TTexts.iAgreeTo,
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                TTexts.privacyPolicy,
                                style: TextStyle(
                                    decorationColor: TColors.primary,
                                    decoration: TextDecoration.underline,
                                    color: TColors.primary),
                              ),
                            ),
                          ),
                          Text(
                            TTexts.and,
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                TTexts.termsOfUse,
                                style: TextStyle(
                                    decorationColor: TColors.primary,
                                    decoration: TextDecoration.underline,
                                    color: TColors.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await register();
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      } else {
                        showSnackBar(context, "Please enter a valid value");
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
                        "Create Account",
                        style: TTextTheme.darkTextTheme.bodyLarge,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    TTexts.orSignUpWith,
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
                          await googleSignInProvider.signInWithGoogle();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerificationScreen()));
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
                        onTap: () async {
                          //  googleSignInProvider.signInWithFacebook();
                          await googleSignInProvider.signInWithFacebook();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerificationScreen()));
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
