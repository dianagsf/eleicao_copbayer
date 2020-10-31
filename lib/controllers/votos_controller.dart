import 'package:copbayer_vote/repositories/votos_repository.dart';
import 'package:get/get.dart';

class VotosPostController extends GetxController {
  VotosPostRepository _votosPostRepository = VotosPostRepository();

  Future<int> postVotos(Map<String, dynamic> votos) async {
    _votosPostRepository.saveVotos(votos).then((value) {
      if (value == 200) return value;
    });

    return null;
  }
}
