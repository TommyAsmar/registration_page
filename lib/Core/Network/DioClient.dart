import 'package:dio/dio.dart';

class DioClient {
  Dio getInstance() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://music.xpertbotacademy.online/api',
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
