import 'package:copbayer_vote/pages/info_pages/info_page.dart';
import 'package:flutter/material.dart';

class EndElectionPage extends StatelessWidget {
  final String data;
  const EndElectionPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoPage(
        image: "images/endVotationImage.png",
        text: "Votações encerradas! O resultado será divulgado no dia $data");
  }
}
