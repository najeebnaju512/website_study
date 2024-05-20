import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/model/data_model.dart';

class Controller extends GetxController {
  List<Student> students = [
    Student(firstname: "Akarsh", lastname: "B R", email: "akarsh@gmail.com", id: 356456, district: "Calicut", phoneNumber: "1234567456", pincode: 123123, country: "India")
  ];

  void addStudent(BuildContext context,
      {required String fname,
      required String lname,
      required String mail,
      required int id,
      required String dist,
      required String phone,
      required int pin,
      required String country}) {
    students.add(Student(
        firstname: fname,
        lastname: lname,
        email: mail,
        id: id,
        district: dist,
        phoneNumber: phone,
        pincode: pin,
        country: country));
  }
}
