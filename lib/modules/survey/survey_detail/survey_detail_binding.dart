import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_controller.dart';

class SurveyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyDetailController());
  }
}
