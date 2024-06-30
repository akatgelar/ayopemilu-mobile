import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_detail/laporan_detail_controller.dart';

class LaporanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaporanDetailController());
  }
}
