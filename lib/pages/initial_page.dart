import 'package:copbayer_vote/pages/info_pages/before_election_page.dart';
import 'package:copbayer_vote/pages/info_pages/end_election_page.dart';
import 'package:copbayer_vote/pages/login_page.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final inicioEleicao = DateTime.parse("2020-09-16 11:50:04Z");

  @override
  Widget build(BuildContext context) {
    final dataInicioEleicao = DateTime(2020, 11, 25); //25/11
    final dataFimEleicao = DateTime(2020, 11, 28); //27/11 (1 dia depois)
    final dataResultado = DateTime(2020, 12, 09); //09/12/2020
    final now = DateTime.now();
    final inicioEleicao = now.isAfter(dataInicioEleicao);
    final fimEleicao = now.isAfter(dataFimEleicao);
    final resultadoEleicao = now.isAfter(dataResultado);
    final dataInicio = "25/11/2020";
    final dataFim = "09/12/2020";

    if ((inicioEleicao && !fimEleicao) || resultadoEleicao) {
      return LoginPage();
    } else if (fimEleicao) {
      return EndElectionPage(
        data: dataFim,
      );
    } else {
      return BeforeElectionPage(data: dataInicio);
    }
  }
}
