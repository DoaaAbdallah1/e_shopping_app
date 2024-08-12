import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryD {
  CategoryD({required this.category, required this.img,required this.isActiveCategory});
  final String category;
  final String img;
  final bool isActiveCategory;

  List listCategory = [];
  addCategories() async{
  await  FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        
        listCategory.add(CategoryD(
          category: doc['category'],
          img: doc['img'],
          isActiveCategory:doc["isActiveCategory"]
        ));

      });
    });
    print(listCategory);
  }
}
