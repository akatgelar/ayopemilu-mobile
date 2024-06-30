import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/logout/logout_controller.dart';

class LogoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoutController());
  }
}
