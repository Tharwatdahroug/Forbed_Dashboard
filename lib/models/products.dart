import 'package:flutter/material.dart';

class Products {
  final String name;
  final String description;
  final String priceFAC;
  final String Category;
  final String productCode;
  final List<String> Sizes;
  final List<String> Colors;
  final List image;
  final String discount;
  final String price;

  Products({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.priceFAC,
    required this.Category,
    required this.productCode,
    required this.Sizes,
    required this.Colors,
    required this.discount,
  });

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'priceFAC': priceFAC,
      'Category': Category,
      'imageUrl': image,
      'productCode': productCode,
      'Sizes': Sizes,
      'Colors;': Colors,
      'discount': discount,
    };
  }
}
