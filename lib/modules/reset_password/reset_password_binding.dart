import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/reset_password/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
