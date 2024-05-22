import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  
  final mailControl = TextEditingController();
  final passControl = TextEditingController();
  final loginValidatkey = GlobalKey<FormState>();

  void resetAll() {
    mailControl.clear();
    passControl.clear();
  }
  void postLogin(){
    if (loginValidatkey.currentState!.validate()) {
      
    } else {
      
    }
  }
}
// ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
//         SnackBar(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.red,
//           content: Text("Failed To Add Data",
//               style: GlTextStyles.interStyl(color: ColorTheme.white, size: 12)),
//           duration: const Duration(seconds: 1),
//           margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
//         ),
//       );