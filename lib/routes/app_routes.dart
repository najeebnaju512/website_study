 import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';

import '../screen/students/create/create_view.dart';
import '../screen/students/list/list_view.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/create',
    routes: [
      GoRoute(
        path: '/create',
        builder: (context, state) => const StudentsCreate(),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const StudentResultList(),
      ),
    ],
  );