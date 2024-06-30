import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_detail/relawan_detail_controller.dart';

class RelawanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelawanDetailController());
  }
}
