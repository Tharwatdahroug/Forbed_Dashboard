// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:forbeddashboard/models/products.dart';

// class FeatureProvider with ChangeNotifier {
//   List<Products> FeatureModelList = [];
//   late Products FeatureModel;
//   Future<void> AddFeature(
//     String name,
//     String description,
//     String Category,
//     String priceFAC,
//     String productCode,
//     List<String> Sizes,
//     List<Color> Colors,
//     List image,
//     String discount,
//     String price,
//   ) async {
//     await FirebaseFirestore.instance
//         .collection('Feature')
//         .add(
//           Products(
//             name: name,
//             description: description,
//             Category: Category,
//             priceFAC: priceFAC,
//             Colors: Colors,
//             image: image,
//             discount: discount,
//             Sizes: Sizes,
//             productCode: productCode,
//             price: price,
//           ) as Map<String, dynamic>,
//         )
//         .then((value) => print("theFeature $name Added Successfully"));
//     notifyListeners();
//   }

//   Future<void> updataProduct(
//       String name,
//       String description,
//       String Category,
//       String priceFAC,
//       String productCode,
//       List<String> Sizes,
//       List<Color> Colors,
//       List image,
//       String discount,
//       String price,
//       var id) async {
//     await FirebaseFirestore.instance
//         .collection('Feature')
//         .doc(id)
//         .update(
//           Products(
//             name: name,
//             description: description,
//             Category: Category,
//             priceFAC: priceFAC,
//             Colors: Colors,
//             image: image,
//             discount: discount,
//             Sizes: Sizes,
//             productCode: productCode,
//             price: price,
//           ) as Map<String, dynamic>,
//         )
//         .then((value) => print("the Feature $name update Successfully"));
//     notifyListeners();
//   }

//   Future<void> deleteFeature(var id) async {
//     await FirebaseFirestore.instance.collection('Feature').doc(id).delete();
//   }

//   Future<void> getFeatureData() async {
//     List<Products> newList = [];
//     QuerySnapshot userSnapShot =
//         await FirebaseFirestore.instance.collection("Feature").get();
//     userSnapShot.docs.forEach(
//       (element) {
//         FeatureModel = Products(
//           name: (element.data() as dynamic)["name"],
//           description: (element.data() as dynamic)["description"],
//           Colors: (element.data() as dynamic)["colors"],
//           Sizes: (element.data() as dynamic)["sizes"],
//           discount: (element.data() as dynamic)["discount"],
//           image: (element.data() as dynamic)["images"],
//           price: (element.data() as dynamic)["price"],
//           priceFAC: (element.data() as dynamic)["priceFAC"],
//           productCode: (element.data() as dynamic)["productCode"],
//           Category: (element.data() as dynamic)["Category"],
//         );
//         newList.add(FeatureModel);

//         FeatureModelList = newList;
//         notifyListeners();
//       },
//     );
//   }

//   List<Products> get getProductModelList {
//     return FeatureModelList;
//   }
// }
