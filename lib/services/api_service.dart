import 'package:dio/dio.dart';

class ApiService {
  late Dio api;

  ApiService() {
    var options = BaseOptions(
      baseUrl: 'https://bootcamp.free.beeceptor.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) => true,
    );
    api = Dio(options);
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    String? authToken,
  }) async {
    Response response = await api.request(
      url,
      data: body,
      options: Options(
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response;
  }
}
