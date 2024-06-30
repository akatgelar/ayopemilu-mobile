import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/survey/survey/survey_controller.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyController());
  }
}
