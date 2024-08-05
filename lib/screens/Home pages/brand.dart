// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shopping_app/constants/colors.dart';
import 'package:e_shopping_app/constants/image_strings.dart';
import 'package:e_shopping_app/screens/Home%20pages/brandProduct.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
        //  backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
      ),
      body: Container(
        margin: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: GridView.builder(
          
            itemCount: 17,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 80,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrandProduct() ,));
                },
                child: Container(
                  height: 80,
                  padding: EdgeInsets.only(right: 8, left: 8),
                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Image(
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            TImages.adidasLogo,
                          )),
                      Container(
                        margin:
                            EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Adidas",
                                  style: TTextTheme.lightTextTheme.headlineSmall,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.verified,
                                  color: TColors.primary,
                                  size: 16,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 83,
                              child: Text(
                                "95 Products",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
