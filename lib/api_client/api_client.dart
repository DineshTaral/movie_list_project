import 'package:dio/dio.dart';

class ApiClient {
  final _dio = Dio();

  Future<Response> getApi({required String url}) async {
    try {
      return await _dio.get(url);
    } catch (onErr) {
      rethrow;
    }
  }
}
