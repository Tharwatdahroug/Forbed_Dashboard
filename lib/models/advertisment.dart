import 'package:flutter/material.dart';

class Advertisment {
  final String uploadedImageUrl;
  final String vendorInformation;
  final String vendor;
  final String id;
  Advertisment({
    required this.uploadedImageUrl,
    required this.vendorInformation,
    required this.vendor,
    required this.id,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'vendor': vendor,
      'vendorInformation': vendorInformation,
      'imageUrl': uploadedImageUrl,
    };
  }
}
