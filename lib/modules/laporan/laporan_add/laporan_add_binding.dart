import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_add/laporan_add_controller.dart';

class LaporanAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaporanAddController());
  }
}
