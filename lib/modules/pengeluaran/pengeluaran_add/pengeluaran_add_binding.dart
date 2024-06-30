import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_add/pengeluaran_add_controller.dart';

class PengeluaranAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PengeluaranAddController());
  }
}
