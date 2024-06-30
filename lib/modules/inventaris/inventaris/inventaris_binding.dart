import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_controller.dart';

class InventarisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventarisController());
  }
}
