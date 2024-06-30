import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_controller.dart';

class RelawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelawanController());
  }
}
