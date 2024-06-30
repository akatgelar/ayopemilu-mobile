// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(const Duration(seconds: 1));
    SessionHelper().removeSession();
    Get.offAllNamed(AppRoutes.login);
  }
}
