import 'package:get/get.dart';
import 'package:sirs/app/modules/records/records/bindings/records_binding.dart';
import 'package:sirs/app/modules/records/records/views/records_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/records/record_actions/bindings/record_actions_binding.dart';
import '../modules/records/record_actions/views/record_actions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECORDS,
      page: () => RecordsView(),
      binding: RecordsBinding(),
      children: [
        GetPage(
          name: _Paths.RECORD_ACTIONS,
          page: () => const RecordActionsView(),
          binding: RecordActionsBinding(),
        ),
      ],
    ),
  ];
}
