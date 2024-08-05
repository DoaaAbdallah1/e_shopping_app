
// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/constants/text_strings.dart';
import 'package:e_shopping_app/screens/SignInScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentSlide = 0;
  List currentIndex = [
    {
      
      "title": TTexts.onBoardingTitle1,
      "subtitle": TTexts.onBoardingSubTitle1,
      "image": TImages.onBoardingImage1,
    },
    {
      "title": TTexts.onBoardingTitle2,
      "subtitle": TTexts.onBoardingSubTitle2,
      "image": TImages.onBoardingImage2,
    },
    {
      "title": TTexts.onBoardingTitle3,
      "subtitle": TTexts.onBoardingSubTitle3,
      "image": TImages.onBoardingImage3,
    },
  ];
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              top: 100,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
      children: [
        Image(
          height: 350,
          width: 350,
          image: AssetImage(currentIndex[currentSlide]["image"]),
        ),
        SizedBox(height: 30,),
        Text(
          currentIndex[currentSlide]["title"],
          style: TTextTheme.lightTextTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          currentIndex[currentSlide]["subtitle"],
          style: TTextTheme.lightTextTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: TextButton(
                onPressed: () {
                    Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>SignInScreen(),
                                ));
                          
                },
                child: Text("skip"),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: currentSlide == index ? 55 : 18,
                        height: 6.5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentSlide == index
                              ? Colors.black
                              : Colors.grey.shade400,
                          // border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.all(14),
                      onPressed: () {
                        setState(() {
                          if (x == true) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>SignInScreen(),
                                ));
                          
                          }
                          if (currentSlide < 2) {
                            currentSlide++;
                          }
                          if (currentSlide == 2) {
                            x = true;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(CircleBorder()),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
