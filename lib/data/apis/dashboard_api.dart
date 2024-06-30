import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:dio/dio.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class DashboardAPI {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> getHome(electionId) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/dashboard/home/$electionId',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
      );
    } catch (err) {
      return (false, null, err.toString());
    }
  }

  Future<dynamic> getVoters(electionId) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/dashboard/voters/$electionId',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
      );
    } catch (err) {
      return (false, null, err.toString());
    }
  }

  Future<dynamic> getReport(electionId) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/dashboard/report/$electionId',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
      );
    } catch (err) {
      return (false, null, err.toString());
    }
  }

  Future<dynamic> getFinance(electionId) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/dashboard/finance/$electionId',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
      );
    } catch (err) {
      return (false, null, err.toString());
    }
  }

  Future<dynamic> getInventory(electionId) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/dashboard/inventory/$electionId',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
      );
    } catch (err) {
      return (false, null, err.toString());
    }
  }
}
