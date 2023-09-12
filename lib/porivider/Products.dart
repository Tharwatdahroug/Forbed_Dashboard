import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/models/products.dart';

import 'package:uuid/uuid.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;

class ProductsProvider with ChangeNotifier {
  List<Products> productModelList = [];
  List<String> productImagesUrls = [];
  List<Color> Colorers = [];
  List<String> Size = [];
  late Products productModel;
  String fileName = "";
  String uploadedImageUrl = "";
  Future<void> AddProduct(
    String name,
    String description,
    String Category,
    double priceFAC,
    String productCode,
    // ignore: non_constant_identifier_names
    List<String> Sizes,
    // ignore: non_constant_identifier_names
    List<Color> Colors,
    List image,
    double discount,
    double price,
  ) async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(productCode)
        .set(Products(
          name: name,
          description: description,
          Category: Category,
          priceFAC: priceFAC,
          Colors: Colors,
          image: image,
          discount: discount,
          Sizes: Sizes,
          productCode: productCode,
          price: price,
        ).toJson())
        .then((value) => print("the product $name Added Successfully"));
    notifyListeners();
  }

  Future<void> updataProduct(
      String name,
      String description,
      String Category,
      double priceFAC,
      String productCode,
      List<dynamic> Sizes,
      List<dynamic> Colors,
      List<dynamic> image,
      double discount,
      double price,
      var id) async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(productCode)
        .update(
          Products(
            name: name,
            description: description,
            Category: Category,
            priceFAC: priceFAC,
            Colors: Colors,
            image: image,
            discount: discount,
            Sizes: Sizes,
            productCode: productCode,
            price: price,
          ).toJson(),
        )
        .then((value) => print("the product $name update Successfully"));
    notifyListeners();
  }

  Future<void> deleteProduct(productCode) async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(productCode)
        .delete();
  }

  Future<void> getProductData() async {
    List<Products> newList = [];
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("Product").get();
    userSnapShot.docs.forEach(
      (element) {
        productModel = Products(
          name: (element.data() as dynamic)["name"],
          description: (element.data() as dynamic)["description"],
          Colors: (element.data() as dynamic)["colors"],
          Sizes: (element.data() as dynamic)["sizes"],
          discount: (element.data() as dynamic)["discount"],
          image: (element.data() as dynamic)["images"],
          price: (element.data() as dynamic)["price"],
          priceFAC: (element.data() as dynamic)["priceFAC"],
          productCode: (element.data() as dynamic)["productCode"],
          Category: (element.data() as dynamic)["Category"],
        );
        newList.add(productModel);

        productModelList = newList;
        notifyListeners();
      },
    );
  }

  List<Products> get getProductModelList {
    return productModelList;
  }

  Future<void> UploadedImages() async {
    FilePickerResult result;
    result = (await FilePicker.platform.pickFiles(type: FileType.image))!;
    if (result != null) {
      Uint8List? uploadedFile = result.files.single.bytes;
      fileName = result.files.single.name;
      firebase_storage.Reference reference =
          firebase_storage.FirebaseStorage.instance.ref().child(Uuid().v1());
      final firebase_storage.UploadTask uploadTask =
          reference.putData(uploadedFile!);
      notifyListeners();
      uploadTask.whenComplete(() async {
        String imageUrl = await uploadTask.snapshot.ref.getDownloadURL();
        print("ssssssssssssssssssss$imageUrl");
        uploadedImageUrl = imageUrl;
        productImagesUrls.add(imageUrl);

        notifyListeners();
      });
    }
  }

  getImageUrl() {
    return uploadedImageUrl;
  }

  postColor(value) {
    Colorers.add(value);
    notifyListeners();
  }

  postSize(value) {
    Size.add(value);
    notifyListeners();
  }

  List<String> get getImageList {
    return productImagesUrls;
  }

  List<Color> get getcolorList {
    return Colorers;
  }

  List<String> get getSize {
    return Size;
  }

  Future<void> deledImageUrl() async {
    uploadedImageUrl;
    notifyListeners();
  }
}
