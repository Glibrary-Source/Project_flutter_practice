
class User {

  String? name;
  String? age;
  String? profileImagePath;

  User({this.name, this.age, this.profileImagePath});

  User.fromJson(Map<String, dynamic> mapData) {
    name = mapData['name'];
    // age = mapData['age'] is String ? int.tryParse(mapData['age']!) : mapData['age'];
    age = mapData['age'];
    profileImagePath = mapData['profileImagePath'];
  }

}