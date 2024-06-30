import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_add/inventaris_add_controller.dart';

class InventarisAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventarisAddController());
  }
}
