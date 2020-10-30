import 'package:copbayer_vote/pages/info_pages/info_page.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoPage(
      image: "images/confirmImage.png",
      text:
          "Seu voto foi computado com sucesso! Confira os resultados dia 09/12/2020.",
    );
  }
}
