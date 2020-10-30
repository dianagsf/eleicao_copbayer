import 'package:copbayer_vote/models/candidatos_model.dart';
import 'package:copbayer_vote/repositories/candidato_repository.dart';
import 'package:get/get.dart';

class CandidatosController extends GetxController {
  var _candidatos = List<CandidatosModel>().obs;
  CandidatoRepository candidatosRepository = CandidatoRepository();
  var _voted = false.obs;

  List<CandidatosModel> get candidatos => _candidatos;
  set candidatos(value) => this._candidatos.value = value;

  bool get voted => _voted.value;
  set voted(value) => this._voted.value = value;

  void loadCandidatos(String area) async {
    candidatosRepository
        .getCandidatos(area)
        .then((data) => {this._candidatos.value = data});
  }
}
