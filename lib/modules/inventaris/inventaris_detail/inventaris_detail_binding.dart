import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_detail/inventaris_detail_controller.dart';

class InventarisDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventarisDetailController());
  }
}
