import 'package:copbayer_vote/pages/info_pages/info_page.dart';
import 'package:flutter/material.dart';

class VotedPage extends StatelessWidget {
  final String votouEm;
  VotedPage({Key key, this.votouEm}) : super(key: key);

  String convertDataEHora(String votouEm) {
    var data = votouEm.split('T');
    var dataConvert = data[0].split('-');
    var dataFormat = "${dataConvert[2]}/${dataConvert[1]}/${dataConvert[0]}";

    var hora = data[1].split('.');

    return "$dataFormat às ${hora[0]}";
  }

  @override
  Widget build(BuildContext context) {
    String dataVoto = convertDataEHora(votouEm);
    return InfoPage(
        image: "images/votedImage.png",
        text:
            "Você já votou em $dataVoto! O resultado será divulgado no dia 09/12/2020");
  }
}
