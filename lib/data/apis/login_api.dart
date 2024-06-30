import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';

class LoginAPI {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> login(body) async {
    try {
      final response = await dio.post(
        '/login',
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: jsonEncode(body),
      );
      if (response.data['message'] == 'Unauthorized') {
        response.data['message'] = 'Email atau Password Salah!';
      }
      return (response.data['status'], response.data['data'], response.data['message']);
    } catch (err) {
      return (false, null, err.toString());
    }
  }
}
