// To parse this JSON data, do
//
//     final productRequestModel = productRequestModelFromMap(jsonString);

import 'dart:convert';

class ProductRequestModel {
  final String title;
  final int price;
  final String description;
  final int categoryId;
  final List<String> images;

  ProductRequestModel({
    required this.title,
    required this.price,
    required this.description,
    this.categoryId = 1,
    this.images = const ['https://placeimg.com/640/480/any'],
  });

  factory ProductRequestModel.fromJson(String str) =>
      ProductRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductRequestModel.fromMap(Map<String, dynamic> json) =>
      ProductRequestModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        categoryId: json["categoryId"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  ProductRequestModel copyWith({
    String? title,
    int? price,
    String? description,
    int? categoryId,
    List<String>? images,
  }) {
    return ProductRequestModel(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
    );
  }
}
