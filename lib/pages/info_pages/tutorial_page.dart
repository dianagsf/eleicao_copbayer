import 'dart:ui';

import 'package:copbayer_vote/pages/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:get/get.dart';

class TutorialPage extends StatefulWidget {
  final String area;
  final int matricula;

  const TutorialPage({Key key, this.area, this.matricula}) : super(key: key);
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  ScrollController _controller = ScrollController();

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 0.8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return tutorialMobile(widget.area, widget.matricula);
        } else {
          return tutorialWeb(
              widget.area, widget.matricula, _controller, scrollCallBack);
        }
      }),
    );
  }
}

Widget tutorialMobile(String area, int matricula) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 58.0, horizontal: 20.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Instruções",
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 50.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),
          Image.asset('images/listImage.png'),
          SizedBox(
            height: 30.0,
          ),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: '1. ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Marque os candidatos em que deseja votar e em seguida clique em ',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5),
                    ),
                    TextSpan(
                        text: '<VOTAR>',
                        style:
                            TextStyle(color: Colors.blue[600], fontSize: 20.0)),
                    TextSpan(
                      text:
                          ' para confirmar seu voto. Somente é possível votar uma vez, mas você poderá votar em quantos candidatos desejar. Assim, marque todos os candidatos que deseja dar seu voto e em seguida verifique se todos serão listados antes de clicar em ',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5),
                    ),
                    TextSpan(
                        text: '<CONFIRMAR>.',
                        style: TextStyle(color: Colors.green, fontSize: 20.0))
                  ])),
          SizedBox(
            height: 30.0,
          ),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: '2. ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          'Caso deseje retificar algum voto, clique no botão ',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5),
                    ),
                    TextSpan(
                        text: '<VOLTAR>',
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                    TextSpan(
                      text: ' e retornará a tela de votação.',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5),
                    ),
                  ])),
          SizedBox(
            height: 30.0,
          ),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: '3. ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          'Não existem votos em branco ou nulos, sendo necessário votar em pelo menos um candidato.',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.5),
                    ),
                  ])),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    'Qualquer dúvida, entre em contato diretamente com a Copbayer pelos telefones:',
                    style: TextStyle(color: Colors.black, fontSize: 18.0)),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20.0,
                      color: Colors.blue[600],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('(21) 2189-0727',
                        style: TextStyle(
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  ' ou ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20.0,
                      color: Colors.blue[600],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('(21) 2189-0726',
                        style: TextStyle(
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
          Text(
            'Obrigado.',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'COPBAYER',
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            height: 100.0,
          ),
          SizedBox(
            height: 50.0,
            width: 500.0,
            child: RaisedButton(
              onPressed: () {
                Get.off(HomePage(
                  area: area,
                  matricula: matricula,
                ));
              },
              color: Colors.blue[600],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.blue[600])),
              child: Center(
                  child: Text(
                "COMEÇAR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    ),
  );
}

Widget tutorialWeb(String area, int matricula, ScrollController controller,
    Function scrollCallBack) {
  return Stack(children: [
    SingleChildScrollView(
      controller: controller,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 58.0, horizontal: 50.0),
        color: Colors.white,
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Instruções",
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'images/listImage.png',
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: '1. ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Marque os candidatos em que deseja votar e em seguida clique em ',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5),
                            ),
                            TextSpan(
                                text: '<VOTAR>',
                                style: TextStyle(
                                    color: Colors.blue[600], fontSize: 20.0)),
                            TextSpan(
                              text:
                                  ' para confirmar seu voto. Somente é possível votar uma vez, mas você poderá votar em quantos candidatos desejar. Assim, marque todos os candidatos que deseja dar seu voto e em seguida verifique se todos serão listados antes de clicar em ',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5),
                            ),
                            TextSpan(
                                text: '<CONFIRMAR>.',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.0))
                          ])),
                  SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: '2. ',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                              text:
                                  'Caso deseje retificar algum voto, clique no botão ',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5),
                            ),
                            TextSpan(
                                text: '<VOLTAR>',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0)),
                            TextSpan(
                              text: ' e retornará a tela de votação.',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5),
                            ),
                          ])),
                  SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: '3. ',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                              text:
                                  'Não existem votos em branco ou nulos, sendo necessário votar em pelo menos um candidato.',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1.5),
                            ),
                          ])),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 600.0,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Text(
                          'Qualquer dúvida, entre em contato diretamente com a Copbayer pelos telefones:',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 20.0,
                            color: Colors.blue[600],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('(21) 2189-0727',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(' ou ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.phone,
                            size: 20.0,
                            color: Colors.blue[600],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('(21) 2189-0726',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Text(
                'Obrigado.',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'COPBAYER',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(
                height: 100.0,
              ),
              SizedBox(
                height: 50.0,
                width: 500.0,
                child: RaisedButton(
                  onPressed: () {
                    Get.off(HomePage(
                      area: area,
                      matricula: matricula,
                    ));
                  },
                  color: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.blue[600])),
                  child: Center(
                      child: Text(
                    "COMEÇAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    /*FlutterWebScroller(
      //Pass a reference to the ScrollCallBack function into the scrollbar
      scrollCallBack,

      //Add optional values
      scrollBarBackgroundColor: Colors.grey[200],
      scrollBarWidth: 20.0,
      dragHandleColor: Colors.blue[600],
      dragHandleBorderRadius: 2.0,
      dragHandleHeight: 40.0,
      dragHandleWidth: 15.0,
    ),*/
  ]);
}
