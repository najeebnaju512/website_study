import 'package:get/get.dart';

import '../../../model/teacher_list/teacher_model.dart';

class DipRateListController extends GetxController {
  RxList<Teacher> getTeacher() {
    return [
      Teacher(1, "Sajin", "Dot Net", 12000),
      Teacher(2, "Sreejith", "Python", 10000),
      Teacher(3, "Amos", "Data Science", 13000),
      Teacher(4, "Akarsh", "Java", 12500),
      Teacher(5, "Nitha", "Flutter", 25000),
      Teacher(6, "Nasri", "C", 16000),
      Teacher(7, "Safa", "C++", 14000),
      Teacher(8, "Anand", "MERN", 17000),
      Teacher(9, "Anuvind", "Rust", 16500),
      Teacher(10, "Jabbar", "Cyber Security", 50000),
    ].obs;
  }
}
