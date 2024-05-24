import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/screen/students/login/login_view.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:nexteons_study_project/utils/constant/storage_keys.dart';
import 'package:nexteons_study_project/utils/router_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/students/create/create_view.dart';
import '../screen/students/list/list_view.dart';
import '../screen/teachers/list/teacher_list_view.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    /// if token ==null
    /// login
    /// token !=null
    /// login->showdetails
    ///
    ///
    /// token!=null --->showdetails
    if (await isTokenStored() == false) {
      return "/login";
    } else {
      if (state.fullPath == "/login") {
        return "/showdetails";
      } else {
        return null;
      }
    }
    // return null;
  },
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: Routernames.addDatas,
      path: '/adddetails',
      builder: (context, state) => const StudentsCreate(),
    ),
    GoRoute(
      name: Routernames.showDatas,
      path: '/showdetails',
      builder: (context, state) => const StudentResultList(),
    ),
    GoRoute(
      name: Routernames.login,
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: Routernames.techerData,
      path: '/teachers',
      builder: (context, state) => const TeacherListView(),
    ),
  ],
);
Future<bool> isTokenStored() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(StorageKeys.accessToken);
  return accessToken != null;
}
