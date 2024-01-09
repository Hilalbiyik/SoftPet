import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? id;
  String name;
  String surname;
  String image;

  User(this.name, this.surname, this.image);

  User.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        surname =map["surname"],
        image =map["image"];


  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "surname": surname,
      "map": image,
    };
  }
}