import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_add/pemilih_add_controller.dart';

class PemilihAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PemilihAddController());
  }
}
