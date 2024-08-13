// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, use_super_parameters, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataFromFireStore extends StatelessWidget {
  String? valuee;
  GetDataFromFireStore({Key? key, required this.valuee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('productss').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic>? data =
              snapshot.data?.data() as Map<String, dynamic>?;
          return Text(valuee!);
        }

        return Text("loading");
      },
    );
  }
}
