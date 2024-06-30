import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount_add/quickcount_add_controller.dart';

class QuickcountAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuickcountAddController());
  }
}
