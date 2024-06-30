import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
