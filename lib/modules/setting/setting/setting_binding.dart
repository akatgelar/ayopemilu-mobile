import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
