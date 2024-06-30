import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_profil/setting_profil_controller.dart';

class SettingProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingProfilController());
  }
}
