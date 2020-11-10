import 'package:copbayer_vote/models/user_model.dart';
import 'package:copbayer_vote/repositories/user_repository.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  MaskedTextController cpfController;
  MaskedTextController dataController;
  UserRepository userRepository = UserRepository();

  var _user = List<UserModel>().obs;

  List<UserModel> get user => _user;
  set user(value) => this._user.value = value;

  @override
  void onInit() {
    cpfController = MaskedTextController(mask: '000.000.000-00');
    dataController = MaskedTextController(mask: '00/00/0000');

    super.onInit();
  }

  String convertCPF() {
    String cpf = cpfController.text.replaceAll('.', '').replaceAll('-', '');
    return cpf;
  }

  String convertData() {
    var data = dataController.text.split('/');
    var dataFormat = "${data[2]}-${data[1]}-${data[0]}";
    return dataFormat;
  }

  void loadUser() async {
    String cpf = convertCPF();
    String dataNasc = convertData();

    userRepository
        .getUser(cpf, dataNasc)
        .then((data) => {this._user.value = data});
  }
}
