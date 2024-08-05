// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shopping_app/screens/Home%20pages/Profile.dart';
import 'package:e_shopping_app/screens/Home%20pages/homeScreen.dart';
import 'package:e_shopping_app/theme/widget_themes/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:path/path.dart' show basename;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final dialogUsernameController = TextEditingController();
  final dialogUsernameController2 = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('usersss');

  File? imgPath;
  String? imgName;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);

    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });

        imgName = basename(pickedImg.path);
        int random = Random().nextInt(9999999);
        imgName = "$random$imgName";

        print(imgName);
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  showModel() {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(22),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  setState(() async {
                    await uploadImage2Screen(ImageSource.camera);
                    print("successfully");
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 26,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Camera",
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.gallery);
                  if (imgPath != null) {
                    print(imgName);
                    print("-------------------");
                    final storageRef = FirebaseStorage.instance.ref(imgName);
                    await storageRef.putFile(imgPath!);
                    print(imgName);
                    print("-------------------");

                    setState(() async {
                      String url = await storageRef.getDownloadURL();
                      users.doc(credential!.uid).update({
                        "imgURL": url,
                      });
                    });
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 26,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  myDialog(Map data, dynamic myKey) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: EdgeInsets.all(22),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: dialogUsernameController,
                  maxLength: myKey == "email" ? 40 : 25,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({myKey: dialogUsernameController.text});

                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 17),
                        )),
                    TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 17),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  myDialog2(Map data, dynamic myKey1, dynamic myKey2) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: EdgeInsets.all(22),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: dialogUsernameController,
                    maxLength: 20,
                    decoration: InputDecoration(hintText: "First Name")),
                SizedBox(
                  height: 18,
                ),
                TextField(
                    controller: dialogUsernameController2,
                    maxLength: 20,
                    decoration: InputDecoration(hintText: "Last Name    ")),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({myKey1: dialogUsernameController.text});
                          users
                              .doc(credential!.uid)
                              .update({myKey2: dialogUsernameController2.text});

                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 17),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 17),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            body: FutureBuilder<DocumentSnapshot>(
              future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(17),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white)),
                                  child:imgPath == null
                          ?  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(499),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(data["imgURL"]))),
                                  )
                          : ClipOval(
                              child: Image.file(
                                imgPath!,
                                width: 145,
                                height: 145,
                                fit: BoxFit.cover,
                              ),
                            ),
                                  
                                  ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //showModel();
                                  },
                                  child: Text("Change Profile Picture"))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Profile Information",
                                    style: TTextTheme.lightTextTheme.titleLarge,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("Name",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "${data["first_name"].toString().capitalize}" +
                                          " " +
                                          "${data["last_name"].toString().capitalize}",
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () {
                                        dialogUsernameController.text =
                                            data["first_name"]
                                                .toString()
                                                .capitalize!;
                                        dialogUsernameController2.text =
                                            data["last_name"]
                                                .toString()
                                                .capitalize!;
                                        myDialog2(
                                            data, "first_name", "last_name");
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 18,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("user",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      data["username"],
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () {
                                        dialogUsernameController.text =
                                            data["username"].toString();
                                        myDialog(data, "username");
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 18,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Personal Information",
                                    style: TTextTheme.lightTextTheme.titleLarge,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("User_ID",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "12346",
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () async {
                                        await uploadImage2Screen(
                                            ImageSource.gallery);
                                        print(imgName);
                                        print("-------------------");
                                        final storageRef = FirebaseStorage
                                            .instance
                                            .ref(imgName);
                                        await storageRef.putFile(imgPath!);
                                        print(imgName);
                                        print("-------------------");

                                        String url =
                                            await storageRef.getDownloadURL();
                                        users.doc(credential!.uid).update({
                                          "imgURL": url,
                                        });
                                        //  await uploadImage2Screen();
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        size: 18,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("E-mail",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      user!.email.toString(),
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 18,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("Phone Number",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      data["phone_number"],
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () {
                                        dialogUsernameController.text =
                                            data["phone_number"].toString();
                                        myDialog(data, "phone_number");
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 18,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text("Password",
                                        style:
                                            TTextTheme.lightTextTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  //  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      data["password"],
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //   SizedBox(width: 10,),
                                  IconButton(
                                      onPressed: () {
                                        dialogUsernameController.text =
                                            data["password"].toString();
                                        myDialog(data, "password");
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 18,
                                      ))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }

                return Center(child: Text("loading"));
              },
            )));
  }
}
