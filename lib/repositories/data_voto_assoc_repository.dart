import 'package:copbayer_vote/repositories/custom_dio.dart';
import 'package:dio/dio.dart';

class DataVotoPostRepository {
  Future<int> setDataVoto(Map<String, dynamic> data) async {
    var dio = CustomDio().instance;

    try {
      var response = await dio.put('/assoc/votou', data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
