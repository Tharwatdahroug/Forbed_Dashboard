// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../constants.dart';
// import 'chart.dart';
// import 'storage_info_card.dart';

// //   void countDocuments() async {
// //     QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('Product').get();
// //     List<DocumentSnapshot> _myDocCount = _myDoc.docs;
// //     print(_myDocCount.length);  // Count of Documents in Collection
// // }
// class StarageDetails extends StatefulWidget {
//   var shopcont;

//   @override
//   State<StarageDetails> createState() => _StarageDetailsState();
// }

// class _StarageDetailsState extends State<StarageDetails> {
//   // var procont;
//   // var shopocont;
//   // var cycont;
//   // var adcont;

//   @override
//   Widget build(BuildContext context) {
//     // QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('Product').get();
//     // List<DocumentSnapshot> _myDocCount = _myDoc.docs;

//     return Container(
//       padding: const EdgeInsets.all(defaultPadding),
//       decoration: const BoxDecoration(
//         color: secondaryColor,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "عدد الاشياء المخزنه",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: defaultPadding),
//           // Chart(
//           //   values: procont,
//           //   valuess: shopocont,
//           //   valuesss: cycont,
//           //   valuessss: adcont,
//           // ),
//           StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection("Shop").snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Something went wrong');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Text("Loading");
//                 }
//                 // return Builder(builder: (context) {
//                 //   procont = snapshot.data!.docs.length;
//                 return StorageInfoCard(
//                   svgSrc: "assets/icons/Documents.svg",
//                   title: "عدد المحلات",
//                   amountOfFiles: snapshot.data!.docs.length.toString(),
//                   numOfFiles: snapshot.data!.docs.length,
//                 );
//                 // });
//               }),
//           StreamBuilder<QuerySnapshot>(
//               stream:
//                   FirebaseFirestore.instance.collection("Product").snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Something went wrong');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Text("Loading");
//                 }
//                 // return Builder(builder: (context) {
//                 //   shopocont = snapshot.data!.docs.length;

//                 return StorageInfoCard(
//                   svgSrc: "assets/icons/folder.svg",
//                   title: "عدد المنتجات",
//                   amountOfFiles: snapshot.data!.docs.length.toString(),
//                   numOfFiles: snapshot.data!.docs.length,
//                 );
//                 // });
//               }),
//           StreamBuilder<QuerySnapshot>(
//               stream:
//                   FirebaseFirestore.instance.collection("Category").snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Something went wrong');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Text("Loading");
//                 }
//                 // return Builder(builder: (context) {
//                 //   cycont = snapshot.data!.docs.length;

//                 return StorageInfoCard(
//                   svgSrc: "assets/icons/unknown.svg",
//                   title: "عدد الاقسام",
//                   amountOfFiles: snapshot.data!.docs.length.toString(),
//                   numOfFiles: snapshot.data!.docs.length,
//                 );
//                 // });
//               }),
//           StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection("Advertisments")
//                   .snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Something went wrong');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Text("Loading");
//                 }
//                 // return Builder(builder: (context) {
//                 //   adcont = snapshot.data!.docs.length;
//                 return StorageInfoCard(
//                   svgSrc: "assets/icons/media.svg",
//                   title: "عدد الاعلانات",
//                   amountOfFiles: snapshot.data!.docs.length.toString(),
//                   numOfFiles: snapshot.data!.docs.length,
//                 );
//                 // });
//               }),
//         ],
//       ),
//     );
//   }
// }
