import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_add/relawan_add_controller.dart';

class RelawanAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelawanAddController());
  }
}
