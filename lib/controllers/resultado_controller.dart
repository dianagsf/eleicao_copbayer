import 'package:copbayer_vote/models/resultado_model.dart';
import 'package:copbayer_vote/repositories/resultado_repository.dart';
import 'package:get/get.dart';

class ResultadoController extends GetxController {
  var _resultado = List<ResultadoModel>().obs;

  ResultadoRepository resultadoRepository = ResultadoRepository();

  List<ResultadoModel> get resultado => _resultado;
  set resultado(value) => this._resultado.value = value;

  void getResultadoEleicao(String area) {
    resultadoRepository
        .getResultado(area)
        .then((data) => {this._resultado.value = data});
  }
}
