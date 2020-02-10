
import 'package:dio/dio.dart';

class FoodModel {
  String id;
  String title;
  String description;
  String fullDescription;
  int price;
  String image;
  MultipartFile imageFile;

  FoodModel({
    this.id, this.title, this.description,
    this.fullDescription, this.price,
    this.image, this.imageFile
  });

  //Coverter dari json ke object
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json["id"].toString(),
      title: json["title"],
      description: json["description"],
      fullDescription: json["full_description"],
      price: int.parse(json["price"].toString()),
      image: json["image"]
    );
  }

  //Converter dari object ke json
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['description'] = description;
    map['full_description'] = fullDescription;
    map['price'] = price;
    map['image'] = imageFile;

    return map;
  }
}

class FoodResponse {
  int status;
  String message;

  FoodResponse({
    this.status, this.message
  });

  //Converter dari json ke object
  factory FoodResponse.fromJson(Map<String, dynamic> json) {
    return FoodResponse(
      status: int.parse(json['status'].toString()),
      message: json['message']
    );
  }
}