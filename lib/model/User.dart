import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  String? id;
  String name;
  String surname;
  String? profileimg;

  Users(this.name, this.surname, this.profileimg);

  Users.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        surname =map["surname"],
        profileimg =map["image"];


  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "surname": surname,
      "image": profileimg,
    };
  }
}