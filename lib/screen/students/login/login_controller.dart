import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/model/login/login_body_mode.dart';
import 'package:nexteons_study_project/repository/students/login/login_api.dart';
import 'package:nexteons_study_project/utils/app_snackbar.dart';
import 'package:nexteons_study_project/utils/constant/storage_keys.dart';
import 'package:nexteons_study_project/utils/router_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/app_const.dart';

class LoginController extends GetxController {
  late SharedPreferences sharedPreferences;
  final nameormailControl = TextEditingController();
  final passControl = TextEditingController();
  final loginValidatkey = GlobalKey<FormState>();

  Map<String, String> loginHeader = {
    "X-Tenant-Id": "RL0582",
  };

  void resetAll() {
    nameormailControl.clear();
    passControl.clear();
  }

  void postLogin() {
    if (loginValidatkey.currentState!.validate()) {
      var data = LoginBody(nameormailControl.text, passControl.text);
      LoginService.postData(data.loginbody, loginHeader).then((response) async {
        if (response["data"] != null) {
          storeRecivedData(response["data"]["Auth_Login"]["accessToken"]);
          var message = "You are successfully logged in";
          AppSnackbar.oneTimeSnackBar(message,
              context: navigatorKey.currentContext!, bgColor: Colors.green);
          GoRouter.of(navigatorKey.currentContext!)
              .goNamed(Routernames.showDatas);
        } else {
          var message = response["errors"][0]["message"];
          AppSnackbar.oneTimeSnackBar(message,
              context: navigatorKey.currentContext!);
        }
      });
    }
  }

  storeRecivedData(accesstoken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = json.encode(accesstoken);
    sharedPreferences.setString(StorageKeys.accessToken, token);
  }
}
//developer.fayizalinp@gmail.com
//0RneWfb0