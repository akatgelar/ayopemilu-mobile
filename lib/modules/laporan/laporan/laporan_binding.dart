import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_controller.dart';

class LaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaporanController());
  }
}
