import 'package:copbayer_vote/models/resultado_model.dart';
import 'package:copbayer_vote/repositories/custom_dio.dart';
import 'package:dio/dio.dart';

class ResultadoRepository {
  Future<List<ResultadoModel>> getResultado(String area) async {
    var dio = CustomDio().instance;

    try {
      var response = await dio.get('/resultado?area=$area');
      return (response.data as List)
          .map((sol) => ResultadoModel.fromJson(sol))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
