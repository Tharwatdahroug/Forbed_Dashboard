import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/models/Advertisment.dart';
import 'dart:async';

import 'package:uuid/uuid.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import "package:firebase_storage/firebase_storage.dart" as firebase_storage;

class AdvertismentProvider with ChangeNotifier {
  List<Advertisment> AdvertismenModelList = [];
  late Advertisment AdvertismentModel;
  String fileName = "";
  String uploadedImageUrl = "";

  Future<void> Addadvertisment(String namevendor, String vendorInformation,
      String imageUrl, String id) async {
    await FirebaseFirestore.instance
        .collection('Advertisment')
        .doc(id)
        .set(
          Advertisment(
            vendor: namevendor,
            vendorInformation: vendorInformation,
            uploadedImageUrl: imageUrl,
            id: id,
          ).toJson(),
        )
        .then((value) => print("User Categroy"));

    notifyListeners;
  }

  Future<void> updataAdvertisment(String namevendor, String vendorInformation,
      String imageUrl, String id) async {
    await FirebaseFirestore.instance
        .collection('Advertisment')
        .doc(id)
        .update(
          Advertisment(
            vendor: namevendor,
            vendorInformation: vendorInformation,
            uploadedImageUrl: imageUrl,
            id: id,
          ).toJson(),
        )
        .then((value) => print("updata Categroy"));

    notifyListeners();
  }

  Future<void> deleteCategroy(id) async {
    await FirebaseFirestore.instance
        .collection('Advertisment')
        .doc(id)
        .delete();
    notifyListeners();
  }

  Future<void> getAdvertismentData() async {
    List<Advertisment> newList = [];
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("Advertisment").get();
    userSnapShot.docs.forEach(
      (element) {
        AdvertismentModel = Advertisment(
          vendor: (element.data() as dynamic)["vendor"],
          vendorInformation: (element.data() as dynamic)["vendorInformation"],
          uploadedImageUrl: (element.data() as dynamic)["imageUrl"],
          id: (element.data() as dynamic)["id"],
        );
        newList.add(AdvertismentModel);

        AdvertismenModelList = newList;
        notifyListeners();
      },
    );
  }

  List<Advertisment> get getUserModelList {
    return AdvertismenModelList;
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
}
