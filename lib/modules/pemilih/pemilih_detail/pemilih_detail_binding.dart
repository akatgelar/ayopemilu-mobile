import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_detail/pemilih_detail_controller.dart';

class PemilihDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PemilihDetailController());
  }
}
