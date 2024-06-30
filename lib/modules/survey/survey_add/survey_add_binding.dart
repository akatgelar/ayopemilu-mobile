import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_add/survey_add_controller.dart';

class SurveyAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyAddController());
  }
}
