import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_detail/pengeluaran_detail_controller.dart';

class PengeluaranDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PengeluaranDetailController());
  }
}
