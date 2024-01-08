//class Person with ChangeNotifier {
  import 'dart:io';

class Person {
  String? id;
  String nameSurname;

  Person(this.nameSurname);

  Person.fromMap(this.id, Map<String, dynamic> map)
      : nameSurname = map["name surname"];


  Map<String, dynamic> toMap() {
    return {
      "name surname": nameSurname,
    };
  }
}
