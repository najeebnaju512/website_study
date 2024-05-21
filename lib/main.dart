import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/screen/students/list/list_view.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:url_strategy/url_strategy.dart';

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
  setPathUrlStrategy();
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
      initialRoute: '/create',
      getPages: [
        GetPage(name: '/create', page: () => const StudentsCreate()),
        GetPage(name: '/result', page: () => const StudentResultList()),
      ],
    );
  }
}
