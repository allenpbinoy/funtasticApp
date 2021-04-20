// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.name,
    this.description,
    this.categories,
    this.price,
  });

  String name;
  String description;
  String categories;
  String price;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        description: json["description"],
        categories: json["categories"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "categories": categories,
        "price": price,
      };
}
