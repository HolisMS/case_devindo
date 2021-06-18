import 'package:case_devindo/pages/local_page.dart';

import './controllers/bindings/app_bindings.dart';
import './pages/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
        name: '/home',
        page: () => HomePage(Get.find()),
        binding: AppBindings()),
    GetPage(
      name: '/local',
      page: () => LocalPage(),
    ),
  ];
}
