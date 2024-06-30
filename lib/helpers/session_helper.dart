// ignore_for_file: avoid_print

import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionHelper {
  Future<bool> isHasSession() async {
    // print("isHasSession");
    final box = GetStorage();

    if (await box.read('id') != null && await box.read("id") != '' && await box.read("id") != 0) {
      return true;
    } else {
      return false;
    }
  }

  checkSesssionPages() async {
    // print('sessionCheck');
    if (!await isHasSession()) {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  checkSessionLogin() async {
    // print('sessionCheck');
    if (await isHasSession()) {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future setSession(SessionModel session) async {
    // print('set session');
    final box = GetStorage();

    await box.write('token', session.token);
    await box.write('id', session.id);
    await box.write('name', session.name);
    await box.write('email', session.email);
    await box.write('gender', session.gender);
    await box.write('bod', session.bod);
    await box.write('phone', session.phone);
    await box.write('address', session.address);
    await box.write('picture', session.picture);
    await box.write('expiredDate', session.expiredDate);
    await box.write('roleId', session.roleId);
    await box.write('roleName', session.roleName);
    await box.write('electionId', session.electionId);
    await box.write('electionCategory', session.electionCategory);
    await box.write('electionArea', session.electionArea);
    await box.write('electionSubarea', session.electionSubarea);
    await box.write('electionVotersAll', session.electionVotersAll);
    await box.write('electionVotersTarget', session.electionVotersTarget);
    await box.write('calegId', session.calegId);
  }

  Future<String> getToken() async {
    // print('get token');
    try {
      final box = GetStorage();
      return box.read('token');
    } catch (err) {
      alertFailed(Get.context, 'Problem get token, $err');
      return '';
    }
  }

  Future<SessionModel> getSession() async {
    // print('get session');
    final box = GetStorage();

    var session = {
      'token': await box.read('token'),
      'id': await box.read('id'),
      'name': await box.read('name'),
      'email': await box.read('email'),
      'gender': await box.read('gender'),
      'bod': await box.read('bod'),
      'phone': await box.read('phone'),
      'address': await box.read('address'),
      'picture': await box.read('picture'),
      'expiredDate': await box.read('expiredDate'),
      'roleId': await box.read('roleId'),
      'roleName': await box.read('roleName'),
      'electionId': await box.read('electionId'),
      'electionCategory': await box.read('electionCategory'),
      'electionArea': await box.read('electionArea'),
      'electionSubarea': await box.read('electionSubarea'),
      'electionVotersAll': await box.read('electionVotersAll'),
      'electionVotersTarget': await box.read('electionVotersTarget'),
      'calegId': await box.read('calegId'),
    };

    return SessionModel.fromMap(session);
  }

  removeSession() async {
    // print('remove session');
    final box = GetStorage();

    await box.remove('token');
    await box.remove('id');
    await box.remove('name');
    await box.remove('email');
    await box.remove('gender');
    await box.remove('bod');
    await box.remove('phone');
    await box.remove('address');
    await box.remove('picture');
    await box.remove('expiredDate');
    await box.remove('roleId');
    await box.remove('roleName');
    await box.remove('electionId');
    await box.remove('electionCategory');
    await box.remove('electionArea');
    await box.remove('electionSubarea');
    await box.remove('electionVotersAll');
    await box.remove('electionVotersTarget');
    await box.remove('calegId');
  }
}
