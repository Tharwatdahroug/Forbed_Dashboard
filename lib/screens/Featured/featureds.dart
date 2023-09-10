// import 'package:ecommercesdashboard/screens/Shop/shop_details.dart';
// import 'package:ecommercesdashboard/screens/product/product_details.dart';
// import 'package:ecommercesdashboard/screens/product/updata_product.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Featured extends StatefulWidget {
// //   var product;

// //  Newshop({this.product});

//   @override
//   _shopState createState() => _shopState();
// }

// class _shopState extends State<Featured> {
//   String searchProduct = "";
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(" عرض كل المحل الجديده"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//             stream:
//                 FirebaseFirestore.instance.collection("Featured").snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Text("Loading");
//               }
//               return ListView(
//                 children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                   Map<String, dynamic> data =
//                       document.data() as Map<String, dynamic>;
//                   if (data.isEmpty) {
//                     Center(
//                       child: Text(
//                         "لايوجد محال مضاف",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     );
//                   }
//                   return Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ShopDetails(
//                                       product: data,
//                                     )));
//                       },
//                       child: Card(
//                         color: Colors.white,
//                         child: Container(
//                             height: MediaQuery.of(context).size.height / 4,
//                             width: MediaQuery.of(context).size.width * 0.9,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: Container(
//                                       child: Image.network(
//                                     data["imageUrl"][0],
//                                     fit: BoxFit.contain,
//                                   )),
//                                 ),
//                                 Expanded(
//                                   flex: 6,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Expanded(
//                                         child: Container(
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     data["name"].toString(),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     ":أسم المحل",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.blueAccent,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ],
//                                               ),
//                                               // Row(
//                                               //   mainAxisAlignment:
//                                               //       MainAxisAlignment.end,
//                                               //   children: [
//                                               //     Text(
//                                               //       data["Shop"].toString(),
//                                               //       style: TextStyle(
//                                               //           color: Colors.black,
//                                               //           fontWeight:
//                                               //               FontWeight.bold),
//                                               //     ),
//                                               //     SizedBox(
//                                               //       width: 10,
//                                               //     ),
//                                               //     Text(
//                                               //       ":أسم المحل",
//                                               //       style: TextStyle(
//                                               //           color:
//                                               //               Colors.blueAccent,
//                                               //           fontWeight:
//                                               //               FontWeight.bold),
//                                               //     ),
//                                               //   ],
//                                               // ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     data["category"].toString(),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     ":القسم",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.blueAccent,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Expanded(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                   children: [
//                                                     Text(
//                                                       data["Codeshop"]
//                                                           .toString(),
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       ":كود المنتج",
//                                                       style: TextStyle(
//                                                           color:
//                                                               Colors.blueAccent,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       // Expanded(
//                                       //   child: Container(
//                                       //     child: Column(
//                                       //       crossAxisAlignment:
//                                       //           CrossAxisAlignment.start,
//                                       //       children: [
//                                       //         Row(
//                                       //           mainAxisAlignment:
//                                       //               MainAxisAlignment.end,
//                                       //           children: [
//                                       //             Text(
//                                       //               data["price"].toString(),
//                                       //               style: TextStyle(
//                                       //                   color: Colors.black,
//                                       //                   fontWeight:
//                                       //                       FontWeight.bold),
//                                       //             ),
//                                       //             SizedBox(
//                                       //               width: 10,
//                                       //             ),
//                                       //             Text(
//                                       //               ":السعر",
//                                       //               style: TextStyle(
//                                       //                   color:
//                                       //                       Colors.blueAccent,
//                                       //                   fontWeight:
//                                       //                       FontWeight.bold),
//                                       //             ),
//                                       //           ],
//                                       //         ),
//                                       //       ],
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         IconButton(
//                                           icon: Icon(
//                                             Icons.delete,
//                                             color: Colors.blueAccent,
//                                           ),
//                                           onPressed: () async {
//                                             await FirebaseFirestore.instance
//                                                 .collection("Featured")
//                                                 .doc(document.id)
//                                                 .delete();
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 // Expanded(
//                                 //   flex: 1,
//                                 //   child: Container(
//                                 //     child: Column(
//                                 //       crossAxisAlignment:
//                                 //           CrossAxisAlignment.center,
//                                 //       mainAxisAlignment:
//                                 //           MainAxisAlignment.center,
//                                 //       children: [
//                                 //         IconButton(
//                                 //           icon: Icon(
//                                 //             Icons.edit,
//                                 //             color: Colors.blueAccent,
//                                 //           ),
//                                 //           onPressed: () async {
//                                 //             await Navigator.push(
//                                 //               context,
//                                 //               MaterialPageRoute(
//                                 //                 builder: (context) => Updata(
//                                 //                   product: data,
//                                 //                   id: document.id,
//                                 //                 ),
//                                 //               ),
//                                 //             );
//                                 //           },
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //   ),
//                                 // ),
//                               ],
//                             )),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           )),
//           TextFormField(
//             onChanged: (val) {
//               setState(() {
//                 searchProduct = val;
//               });
//             },
//             enabled: true,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search),
//               hintText: 'ابحث عن منتج',
//               hintStyle: TextStyle(color: Colors.white, fontSize: 14),
//               filled: true,
//               fillColor: Color(0xFF2A2D3E),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 15,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection("Shop").snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Text("Loading");
//               }
//               return ListView(
//                 children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                   Map<String, dynamic> data =
//                       document.data() as Map<String, dynamic>;

//                   return Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ProductDetails(
//                                       product: data,
//                                     )));
//                       },
//                       child: Card(
//                         color: Colors.white,
//                         child: Container(
//                             height: MediaQuery.of(context).size.height / 4,
//                             width: MediaQuery.of(context).size.width * 0.9,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: Container(
//                                       child: Image.network(
//                                     data["imageUrl"][0],
//                                     fit: BoxFit.contain,
//                                   )),
//                                 ),
//                                 Expanded(
//                                   flex: 6,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Expanded(
//                                         child: Container(
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     data["name"].toString(),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     ":أسم المحل",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.blueAccent,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ],
//                                               ),
//                                               // Row(
//                                               //   mainAxisAlignment:
//                                               //       MainAxisAlignment.end,
//                                               //   children: [
//                                               //     Text(
//                                               //       data["Shop"].toString(),
//                                               //       style: TextStyle(
//                                               //           color: Colors.black,
//                                               //           fontWeight:
//                                               //               FontWeight.bold),
//                                               //     ),
//                                               //     SizedBox(
//                                               //       width: 10,
//                                               //     ),
//                                               //     Text(
//                                               //       ":أسم المحل",
//                                               //       style: TextStyle(
//                                               //           color:
//                                               //               Colors.blueAccent,
//                                               //           fontWeight:
//                                               //               FontWeight.bold),
//                                               //     ),
//                                               //   ],
//                                               // ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     data["category"].toString(),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     ":القسم",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.blueAccent,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Expanded(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                   children: [
//                                                     Text(
//                                                       data["Codeshop"]
//                                                           .toString(),
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       ":كود المنتج",
//                                                       style: TextStyle(
//                                                           color:
//                                                               Colors.blueAccent,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       // Expanded(
//                                       //   child: Container(
//                                       //     child: Column(
//                                       //       crossAxisAlignment:
//                                       //           CrossAxisAlignment.start,
//                                       //       children: [
//                                       //         Row(
//                                       //           mainAxisAlignment:
//                                       //               MainAxisAlignment.end,
//                                       //           children: [
//                                       //             Text(
//                                       //               data["price"].toString(),
//                                       //               style: TextStyle(
//                                       //                   color: Colors.black,
//                                       //                   fontWeight:
//                                       //                       FontWeight.bold),
//                                       //             ),
//                                       //             SizedBox(
//                                       //               width: 10,
//                                       //             ),
//                                       //             Text(
//                                       //               ":السعر",
//                                       //               style: TextStyle(
//                                       //                   color:
//                                       //                       Colors.blueAccent,
//                                       //                   fontWeight:
//                                       //                       FontWeight.bold),
//                                       //             ),
//                                       //           ],
//                                       //         ),
//                                       //       ],
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         IconButton(
//                                           icon: Icon(
//                                             Icons.add,
//                                             color: Colors.blueAccent,
//                                           ),
//                                           onPressed: () async {
//                                             await FirebaseFirestore.instance
//                                                 .collection("Featured")
//                                                 .add({
//                                               'name': data['name'],
//                                               'imageUrl': data["imageUrl"],
//                                               'description':
//                                                   data["description"],
//                                               'category': data["category"],
//                                               'subCategories':
//                                                   data["subCategories"],
//                                               'Codeshop': data["Codeshop"],
//                                               'nameShopOwner':
//                                                   data["nameShopOwner"],
//                                               'PhoneShopOwner':
//                                                   data["PhoneShopOwner"],
//                                             }).then((value) {
//                                               print(
//                                                   "^^^^^^^^^^^^^^^^^^^ Shop  Added Successfully");
//                                               setState(() {
//                                                 isLoading = false;
//                                               });
//                                             }).catchError((ex) {
//                                               print(
//                                                   "^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Failed To Add Category  $ex");
//                                               setState(() {
//                                                 isLoading = false;
//                                               });
//                                             });
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 // Expanded(
//                                 //   flex: 1,
//                                 //   child: Container(
//                                 //     child: Column(
//                                 //       crossAxisAlignment:
//                                 //           CrossAxisAlignment.center,
//                                 //       mainAxisAlignment:
//                                 //           MainAxisAlignment.center,
//                                 //       children: [
//                                 //         IconButton(
//                                 //           icon: Icon(
//                                 //             Icons.edit,
//                                 //             color: Colors.blueAccent,
//                                 //           ),
//                                 //           onPressed: () async {
//                                 //             await Navigator.push(
//                                 //               context,
//                                 //               MaterialPageRoute(
//                                 //                 builder: (context) => Updata(
//                                 //                   product: data,
//                                 //                   id: document.id,
//                                 //                 ),
//                                 //               ),
//                                 //             );
//                                 //           },
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //   ),
//                                 // ),
//                               ],
//                             )),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
