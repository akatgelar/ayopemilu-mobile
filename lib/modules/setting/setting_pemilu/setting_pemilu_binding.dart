import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_pemilu/setting_pemilu_controller.dart';

class SettingPemiluBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPemiluController());
  }
}
