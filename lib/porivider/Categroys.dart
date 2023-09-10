import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/models/categorys.dart';
import 'package:uuid/uuid.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;

class CategroyProvider with ChangeNotifier {
  List<Categroys> CategoryModelList = [];
  late Categroys CategoryModel;
  String fileName = "";
  String uploadedImageUrl = "";
  // late String doc;

  CollectionReference<Map<String, dynamic>> userSnapShot =
      FirebaseFirestore.instance.collection('Categroys');
  // ignore: non_constant_identifier_names
  Future<void> AddCategroy(
      String nameCategory, String imageUrl, String id) async {
    await FirebaseFirestore.instance
        .collection('Categroys')
        .doc(id)
        .set(
          Categroys(
            nameCategory: nameCategory,
            imageUrl: imageUrl,
            id: id,
          ).toJson(),
        )
        .then((value) => print(" sarwat"));
    notifyListeners();
  }

  Future<void> updataCategroy(
      String nameCategory, String imageUrl, String id) async {
    await FirebaseFirestore.instance
        .collection('Categroys')
        .doc(id)
        .update(
          Categroys(
            nameCategory: nameCategory,
            imageUrl: imageUrl,
            id: id,
          ).toJson(),
        )
        .then((DocumentReference doc) {
          print("ssssssssssssssssssssssaa $doc");
        } as FutureOr Function(void value));

    notifyListeners();
  }

  Future<void> deleteCategroy(id) async {
    await FirebaseFirestore.instance
        .collection('Categroys')
        .doc("$id")
        .delete();
    notifyListeners();
  }

  Future<void> getCategoryData() async {
    List<Categroys> newList = [];
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("Categroys").get();
    userSnapShot.docs.forEach(
      (element) {
        CategoryModel = Categroys(
          id: (element.data() as dynamic)["id"],
          nameCategory: (element.data() as dynamic)["nameCategory"],
          imageUrl: (element.data() as dynamic)["imageUrl"],
        );
        newList.add(CategoryModel);
      },
    );
    CategoryModelList = newList;
    notifyListeners();
  }

  List<Categroys> get getUserModelList {
    return CategoryModelList;
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
        notifyListeners();
      });
    }
  }

  getImageUrl() {
    return uploadedImageUrl;
  }

  Future<void> deledImageUrl() async {
    uploadedImageUrl = "";
    notifyListeners();
  }

  // getId() {
  //   return idToke;
  // }
}
