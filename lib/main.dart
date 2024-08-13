// ignore_for_file: prefer_const_constructors

import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/firebase_options.dart';
import 'package:e_shopping_app/model/product.dart';
import 'package:e_shopping_app/provider/googleSignin.dart';
import 'package:e_shopping_app/screens/EmailVerificationScreen.dart';
import 'package:e_shopping_app/screens/Home%20pages/HomeMainScreen.dart';
import 'package:e_shopping_app/screens/onBoardingScreen.dart';
import 'package:e_shopping_app/shared/snakbar.dart';
import 'package:e_shopping_app/theme/theme.dart';
import 'package:e_shopping_app/provider/dataChanged.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 3));
  FlutterNativeSplash.remove();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) {
          return CartItem1(
              index: 0,
              quantity: 0,
              product: Product(
                  title: "title",
                  description: "description",
                  image: "image",
                  price: 0,
                  category: "category",
                  rate: 0,
                  discount: 0,
                  isHeart: true,
                  index: 0));
        }),
        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
          title: TTexts.appName,
          themeMode: ThemeMode.light,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                return EmailVerificationScreen(); // home() OR verify email
              } else {
                return OnBoardingScreen();
              }
            },
          )),
    );
  }
}
