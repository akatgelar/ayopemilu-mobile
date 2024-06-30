import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_controller.dart';

class PengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PengeluaranController());
  }
}
