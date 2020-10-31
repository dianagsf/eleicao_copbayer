import 'package:dio/dio.dart';

class CustomDio {
  var _dio;
//192.168.0.103 localhost
// 54.232.172.126 server
// TROCAR A PORTA 443 NO HTTPS
  CustomDio() {
    _dio = Dio(BaseOptions(
        baseUrl:
            'http://ec2-54-232-172-126.sa-east-1.compute.amazonaws.com:3000'));
  }

  Dio get instance => _dio;
}
