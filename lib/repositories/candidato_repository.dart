import 'package:copbayer_vote/models/candidatos_model.dart';
import 'package:copbayer_vote/repositories/custom_dio.dart';
import 'package:dio/dio.dart';

class CandidatoRepository {
  Future<List<CandidatosModel>> getCandidatos(String area) async {
    var dio = CustomDio().instance;
    try {
      var response = await dio.get('/delegados?area=$area');

      return (response.data as List)
          .map((sol) => CandidatosModel.fromJson(sol))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
