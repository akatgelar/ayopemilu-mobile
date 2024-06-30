import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_controller.dart';

class PemilihBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PemilihController());
  }
}
