import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

// Select and image from the gallery or take a picture with the camera
// Then upload to Firebase Storage
FirebaseStorage storage = FirebaseStorage.instance;

Future<void> _upload(String inputSource) async {
  final picker = ImagePicker();
  XFile? pickedImage;
  try {
    pickedImage = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920);

    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);

    try {
      // Uploading the selected image with some custom meta data
      await storage.ref(fileName).putFile(
          imageFile,
          SettableMetadata(customMetadata: {
            'uploaded_by': 'A bad guy',
            'description': 'Some description...'
          }));

      // Refresh the UI
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}

// Retriew the uploaded images
// This function is called when the app launches for the first time or when an image is uploaded or deleted
Future<List<Map<String, dynamic>>> _loadImages() async {
  List<Map<String, dynamic>> files = [];

  final ListResult result = await storage.ref().list();
  final List<Reference> allFiles = result.items;

  await Future.forEach<Reference>(allFiles, (file) async {
    final String fileUrl = await file.getDownloadURL();
    final FullMetadata fileMeta = await file.getMetadata();
    files.add({
      "url": fileUrl,
      "path": file.fullPath,
      "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
      "description": fileMeta.customMetadata?['description'] ?? 'No description'
    });
  });

  return files;
}

// Delete the selected image
// This function is called when a trash icon is pressed
Future<void> _delete(String ref) async {
  await storage.ref(ref).delete();
  // Rebuild the UI
}
