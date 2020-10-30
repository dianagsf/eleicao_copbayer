import 'package:copbayer_vote/repositories/custom_dio.dart';
import 'package:dio/dio.dart';

class VotosPostRepository {
  Future<int> saveVotos(Map<String, dynamic> data) async {
    var dio = CustomDio().instance;

    try {
      var response = await dio.post('/votos', data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
