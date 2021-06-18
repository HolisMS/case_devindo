import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioBindings extends Bindings {
  final String _baseUrl = 'http://jsonplaceholder.typicode.com';
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );

    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor());
    return dio;
  }

  @override
  void dependencies() {
    Get.lazyPut(_dio);
  }
}
