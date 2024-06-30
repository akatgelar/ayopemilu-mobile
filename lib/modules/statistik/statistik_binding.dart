import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/statistik/statistik_controller.dart';

class StatistikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatistikController());
  }
}
