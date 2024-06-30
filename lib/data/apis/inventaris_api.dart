import 'dart:convert';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:dio/dio.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class InventarisAPI {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> getCount(where) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/inventory?count=true&where=$where',
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
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }

  Future<dynamic> getAll(where, sort, perPage, page, search) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/inventory?where=$where&sort=$sort&per_page=$perPage&page=$page&search=$search',
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
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }

  Future<dynamic> getById(id) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.get(
        '/inventory/$id',
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
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }

  Future<dynamic> insert(body) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.post(
        '/inventory',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: jsonEncode(body),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }

  Future<dynamic> update(id, body) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.put(
        '/inventory/$id',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: jsonEncode(body),
      );
      await checkTokenExpired(response.data['message']);
      return (
        response.data['status'],
        response.data['data'],
        response.data['message'],
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }

  Future<dynamic> delete(id) async {
    var token = await SessionHelper().getToken();
    try {
      final response = await dio.delete(
        '/inventory/$id',
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
        response.data['pagination'],
      );
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }
}
