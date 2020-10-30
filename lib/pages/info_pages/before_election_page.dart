import 'package:copbayer_vote/pages/info_pages/info_page.dart';
import 'package:flutter/material.dart';

class BeforeElectionPage extends StatelessWidget {
  final String data;
  const BeforeElectionPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      image: "images/beforeImage.png",
      text: "A eleição começará dia $data",
    );
  }
}
