import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_controller.dart';

class QuickcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuickcountController());
  }
}
