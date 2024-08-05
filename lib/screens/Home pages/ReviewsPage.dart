// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reviews & ratings"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          
          child: Container(
            height: 100000,
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 395,
                    child: Text(
                        "Reviews and ratings are available at the following locations and will  at the following locations and will be available at the following locations and will be ")),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "4.7",
                      style: TextStyle(fontSize: 49, fontWeight: FontWeight.w600),
                    ),
                    Column(
                      //  crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("5"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 220,
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 11,
                                backgroundColor: TColors.grey,
                                borderRadius: BorderRadius.circular(7),
                                valueColor:
                                    const AlwaysStoppedAnimation(TColors.primary),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("4"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 220,
                              child: LinearProgressIndicator(
                                value: 0.8,
                                minHeight: 11,
                                backgroundColor: TColors.grey,
                                borderRadius: BorderRadius.circular(7),
                                valueColor:
                                    const AlwaysStoppedAnimation(TColors.primary),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("3"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 220,
                              child: LinearProgressIndicator(
                                value: 0.6,
                                minHeight: 11,
                                backgroundColor: TColors.grey,
                                borderRadius: BorderRadius.circular(7),
                                valueColor:
                                    const AlwaysStoppedAnimation(TColors.primary),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("2"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 220,
                              child: LinearProgressIndicator(
                                value: 0.4,
                                minHeight: 11,
                                backgroundColor: TColors.grey,
                                borderRadius: BorderRadius.circular(7),
                                valueColor:
                                    const AlwaysStoppedAnimation(TColors.primary),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("1"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 220,
                              child: LinearProgressIndicator(
                                value: 0.2,
                                minHeight: 11,
                                backgroundColor: TColors.grey,
                                borderRadius: BorderRadius.circular(7),
                                valueColor:
                                    const AlwaysStoppedAnimation(TColors.primary),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBarIndicator(
                      rating: 3.6,
                      unratedColor: TColors.grey,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: TColors.primary,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      //  direction: Axis.vertical,
                    ),
                    Text("13,345")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(TImages.userProfileImage1),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "John Doe",
                                      style: TTextTheme.lightTextTheme.titleLarge,
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.more_vert))
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: 3.6,
                                  unratedColor: TColors.grey,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: TColors.primary,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  //  direction: Axis.vertical,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "02 Nav, 2023",
                                  style: TTextTheme.lightTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ReadMoreText(
                              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                              trimMode: TrimMode.Line,
                              trimLines: 2,
                              colorClickableText: TColors.primary,
                              trimCollapsedText: 'read more',
                              trimExpandedText: 'read less',
                              moreStyle: TextStyle(
                                  fontSize: 14,
                                  color: TColors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: TColors.grey,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "T's Store",
                                        style: TTextTheme.lightTextTheme.titleMedium,
                                      ),
                                      Text(
                                        "02 Nav, 2023",
                                        style: TTextTheme.lightTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ReadMoreText(
                                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast).',
                                    trimMode: TrimMode.Line,
                                    trimLines: 2,
                                    colorClickableText: TColors.primary,
                                    trimCollapsedText: 'read more',
                                    trimExpandedText: 'read less',
                                    moreStyle: TextStyle(
                                        fontSize: 14,
                                        color: TColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                        ,SizedBox(height: 28,)
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
