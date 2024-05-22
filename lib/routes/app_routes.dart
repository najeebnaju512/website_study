import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/screen/students/login/login_view.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:nexteons_study_project/utils/router_names.dart';

import '../screen/students/create/create_view.dart';
import '../screen/students/list/list_view.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  redirect: (context, state) {
    return null;  
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
  ],
);
