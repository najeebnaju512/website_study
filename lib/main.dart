import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';

import 'model/data_model.dart';
import 'screen/students/create/create_view.dart';
  RxList<Student> students = [
    Student(
        firstname: "Akarsh",
        lastname: "B R",
        email: "akarsh@gmail.com",
        id: 356456,
        district: "Calicut",
        phoneNumber: "1234567456",
        pincode: 123123,
        country: "India")
  ].obs;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Nexteons Study',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const StudentsCreate());
  }
}
