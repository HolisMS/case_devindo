import '../../services/service_api.dart';
import '../home_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => ServiceApi(Get.find()));
  }
}
