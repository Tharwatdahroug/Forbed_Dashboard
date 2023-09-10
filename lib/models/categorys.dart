import 'package:flutter/material.dart';

class Categroys with ChangeNotifier {
  Categroys({
    required this.nameCategory,
    required this.imageUrl,
    required this.id,
  });

  final String nameCategory;
  final String imageUrl;
  final String id;
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nameCategory': nameCategory,
      'imageUrl': imageUrl,
    };
  }
}
