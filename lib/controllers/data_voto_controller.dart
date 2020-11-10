import 'package:copbayer_vote/repositories/data_voto_assoc_repository.dart';
import 'package:get/get.dart';

class DataVotoPostController extends GetxController {
  DataVotoPostRepository _dataVotosPostRepository = DataVotoPostRepository();

  Future<int> postDataVoto(Map<String, dynamic> dataVoto) async {
    _dataVotosPostRepository.setDataVoto(dataVoto).then((value) {
      if (value == 200) return value;
    });

    return null;
  }
}
