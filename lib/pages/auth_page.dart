import 'package:copbayer_vote/models/user_model.dart';
import 'package:copbayer_vote/pages/info_pages/before_election_page.dart';
import 'package:copbayer_vote/pages/info_pages/end_election_page.dart';
import 'package:copbayer_vote/pages/info_pages/resultado_pages/resultado_page.dart';
import 'package:copbayer_vote/pages/info_pages/tutorial_page.dart';
import 'package:copbayer_vote/pages/info_pages/voted_page.dart';
import 'package:copbayer_vote/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String cpf;
  final String data;
  const AuthPage({Key key, this.cpf, this.data}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Future<List<UserModel>> user;
  UserRepository _repositoryUser;
  String cpfConvert;
  String dataNasc;

  String convertCPF() {
    String cpf = widget.cpf.replaceAll('.', '').replaceAll('-', '');
    return cpf;
  }

  String convertData() {
    var data = widget.data.split('/');
    var dataFormat = "${data[2]}-${data[1]}-${data[0]}";
    return dataFormat;
  }

  @override
  void initState() {
    super.initState();
    cpfConvert = convertCPF();
    dataNasc = convertData();

    _repositoryUser = UserRepository();
    user = _repositoryUser.getUser(cpfConvert, dataNasc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: user,
        builder:
            (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
              break;
            default:
              if (snapshot.hasError) {
                print("########## = ${snapshot.error}");
                return _showAlertDialog(context);
              } else {
                if (snapshot.data.isEmpty) {
                  return _showAlertDialog(context);
                } else {
                  //DATA RESULTADO DA ELEIÇÃO = 09/12/2020
                  var dataResultado = DateTime(2020, 12, 09);
                  //DATA FIM DA ELEIÇÃO = 28/11/2020
                  var dataFimEleicao = DateTime(2020, 11, 28);
                  //DATA INÍCIO DA ELEIÇÃO = 25/11/2020
                  var dataInicioEleicao = DateTime(2020, 11, 25);
                  var now = DateTime.now();

                  // ------------ ADM -------------

                  if (snapshot.data[0].cPF.compareTo('11111111111') == 0) {
                    return TutorialPage(
                        area: snapshot.data[0].aREA,
                        matricula: snapshot.data[0].mATRICULA);
                  }

                  if (snapshot.data[0].cPF.compareTo('22222222222') == 0) {
                    return ResultadoPage(
                      area: snapshot.data[0].aREA,
                    );
                  }
                  // ------------- ADM --------------

                  // AINDA NÃO COMEÇARAM AS ELEIÇÕES
                  if (now.isBefore(dataInicioEleicao)) {
                    return BeforeElectionPage(data: "25/11/2020");
                  }

                  // JÁ VOTOU, AINDA NÃO ACABARAM AS ELEIÇÕES, AINDA NÃO DEU RESULTADO
                  if (snapshot.data[0].vOTOUEM != null &&
                      now.isBefore(dataResultado) &&
                      now.isBefore(dataFimEleicao)) {
                    return VotedPage(votouEm: snapshot.data[0].vOTOUEM);
                  }

                  // JÁ VOTOU, JÁ ACABARAM AS ELEIÇÕES MAS ANTES DA DATA RESULTADO
                  if (snapshot.data[0].vOTOUEM != null &&
                      now.isBefore(dataResultado) &&
                      now.isAfter(dataFimEleicao)) {
                    return VotedPage(votouEm: snapshot.data[0].vOTOUEM);
                  }

                  // NÃO VOTOU MAS JÁ ACABARAM AS ELEIÇÕES (ANTES DO RESULTADO)
                  if (snapshot.data[0].vOTOUEM == null &&
                      now.isBefore(dataResultado) &&
                      now.isAfter(dataFimEleicao)) {
                    return EndElectionPage(
                      data: "09/12/2020",
                    );
                  }

                  //DATA RESULTADO
                  if (now.isAfter(dataResultado)) {
                    return ResultadoPage(
                      area: snapshot.data[0].aREA,
                    );
                  }

                  // LIBERADO PARA VOTAR
                  return TutorialPage(
                      area: snapshot.data[0].aREA,
                      matricula: snapshot.data[0].mATRICULA);
                }
              }
          }
        },
      ),
    );
  }
}

Widget _showAlertDialog(BuildContext context) {
  return Center(
      child: AlertDialog(
    title: Text("Não foi possível realizar o login"),
    content: Text("Confira seus dados e tente novamente."),
    actions: [
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  ));
}
