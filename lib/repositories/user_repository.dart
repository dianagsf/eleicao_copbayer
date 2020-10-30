import 'package:copbayer_vote/models/user_model.dart';
import 'package:copbayer_vote/repositories/custom_dio.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<List<UserModel>> getUser(String cpf, String dataNasc) async {
    var dio = CustomDio().instance;
    try {
      var response = await dio.get('/login?cpf=$cpf&dataNasc=$dataNasc');

      if (response.statusCode != 200) return null;
      return (response.data as List)
          .map((sol) => UserModel.fromJson(sol))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
