// ignore_for_file: depend_on_referenced_packages

import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class UploadAPI {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> uploadFile(List<int> file, String fileName) async {
    var token = await SessionHelper().getToken();
    try {
      FormData formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(
          file,
          filename: fileName,
          contentType: MediaType("image", "png"),
        )
      });
      var response = await dio.post(
        '/upload',
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        data: formData,
      );
      await checkTokenExpired(response.data['message']);
      return (response.data['status'], response.data['data'], response.data['message']);
    } catch (err) {
      return (false, null, err.toString(), null);
    }
  }
}
