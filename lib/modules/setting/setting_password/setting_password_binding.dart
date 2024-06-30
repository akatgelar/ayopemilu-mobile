import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_password/setting_password_controller.dart';

class SettingPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPasswordController());
  }
}
