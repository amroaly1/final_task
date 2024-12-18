import 'package:final_task/core/constant/firebase_constant.dart';

class DocotorModel {
  final String name;
  final String phone;
  final String email;
  final String location;
  final String age;
  final String description;
  final int gender;

  DocotorModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.age,
    required this.description,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      FirebaseConstant.name: name,
      FirebaseConstant.phone: phone,
      FirebaseConstant.email: email,
      FirebaseConstant.location: location,
      FirebaseConstant.age: age,
      FirebaseConstant.description: description,
      FirebaseConstant.gender: gender,
    };
  }
}
