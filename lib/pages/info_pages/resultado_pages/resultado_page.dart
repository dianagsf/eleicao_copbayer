import 'package:cached_network_image/cached_network_image.dart';
import 'package:copbayer_vote/controllers/resultado_controller.dart';
import 'package:copbayer_vote/models/resultado_model.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ResultadoPage extends StatefulWidget {
  final String area;
  const ResultadoPage({Key key, this.area}) : super(key: key);

  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  final ResultadoController resultadoController =
      Get.put(ResultadoController());

  ScrollController _controller = ScrollController();

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 1.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: true,
    );
    return DefaultTabController(
        length: 3,
        child: ResponsiveWidgets.builder(
          height: 1920,
          width: 1080,
          allowFontScaling: true,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.blue[600],
                indicatorWeight: 8.0,
                labelColor: Colors.blue[600],
                labelStyle:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                tabs: [
                  MediaQuery.of(context).size.width > 800
                      ? Tab(
                          text: 'DELEGADOS ELEITOS',
                        )
                      : Tab(
                          text: 'ELEITOS',
                        ),
                  MediaQuery.of(context).size.width > 800
                      ? Tab(
                          text: 'SUPLENTES ELEITOS',
                        )
                      : Tab(text: 'SUPLENTES'),
                  Tab(
                    text: 'NÃO ELEITOS',
                  )
                ],
              ),
              title: TextResponsive(
                'Resultado Delegados ${widget.area} - 2020',
                style: MediaQuery.of(context).size.width < 900
                    ? TextStyle(fontSize: 50.0, color: Colors.black)
                    : TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
            body: TabBarView(
              children: [
                Stack(children: [
                  SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      child: GetX<ResultadoController>(
                        initState: (state) {
                          resultadoController.getResultadoEleicao(widget.area);
                        },
                        builder: (_) {
                          return _.resultado.length < 1
                              ? Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              : widget.area.compareTo('RJ') == 0
                                  ? _.resultado.length < 14
                                      ? buildListResultado(_.resultado)
                                      : buildListResultado(
                                          _.resultado.sublist(0, 14))
                                  : _.resultado.length < 10
                                      ? buildListResultado(_.resultado)
                                      : buildListResultado(
                                          _.resultado.sublist(0, 10));
                        },
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
                ]),
                Stack(children: [
                  SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      child: GetX<ResultadoController>(
                        builder: (_) {
                          return _.resultado.length < 1
                              ? Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              : widget.area.compareTo('RJ') == 0
                                  ? _.resultado.length < 28
                                      ? buildListResultado(
                                          _.resultado.sublist(14))
                                      : buildListResultado(
                                          _.resultado.sublist(14, 28))
                                  : _.resultado.length < 20
                                      ? buildListResultado(
                                          _.resultado.sublist(10))
                                      : buildListResultado(
                                          _.resultado.sublist(10, 20));
                        },
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
                ]),
                Stack(children: [
                  SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      child: GetX<ResultadoController>(
                        builder: (_) {
                          return _.resultado.length < 1
                              ? Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              : widget.area.compareTo('RJ') == 0
                                  ? _.resultado.length > 28
                                      ? buildListResultado(
                                          _.resultado.sublist(28))
                                      : null
                                  : _.resultado.length > 20
                                      ? buildListResultado(
                                          _.resultado.sublist(20))
                                      : null;
                        },
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
                ]),
              ],
            ),
          ),
        ));
  }
}

Widget buildListResultado(List<ResultadoModel> resultado) {
  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Table(
      defaultColumnWidth: Get.mediaQuery.size.width < 900
          ? FixedColumnWidth(50.0)
          : FixedColumnWidth(100.0),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 0.5,
        ),
      ),
      children: [
        TableRow(
          children: [
            "",
            "Nome",
            "Votos",
            "Detalhes",
          ]
              .map((value) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize:
                              Get.mediaQuery.size.width < 800 ? 18.0 : 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    padding: EdgeInsets.all(8.0),
                  ))
              .toList(),
        )
      ],
    ),
    Table(
      defaultColumnWidth: Get.mediaQuery.size.width < 800
          ? FixedColumnWidth(50.0)
          : FixedColumnWidth(100.0),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black87,
          style: BorderStyle.solid,
          width: 0.3,
        ),
      ),
      children: resultado.map<TableRow>((value) {
        return TableRow(children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "${resultado.indexOf(value) + 1}º",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
            padding: EdgeInsets.all(8.0),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              value.nOME,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              value.qTDVOTOS.toString(),
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600]),
            ),
            padding: EdgeInsets.all(8.0),
          ),
          Container(
            alignment: Alignment.center,
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Get.dialog(showDetalhes(value.nOME, value.cANDIDATO,
                      value.aSSOCIADO, value.nASCIMENTO));
                }),
            padding: EdgeInsets.all(8.0),
          ),
        ]);
      }).toList(),
    )
  ]);
}

String convertData(String d) {
  var data = d.split('T');
  var dataConvert = data[0].split('-');
  var dataFormat = "${dataConvert[2]}/${dataConvert[1]}/${dataConvert[0]}";

  return "$dataFormat";
}

Widget showDetalhes(
    String nome, int matricula, String dataAssoc, String dataNasc) {
  return AlertDialog(
    title: Text(nome),
    content: SingleChildScrollView(
      child: ListBody(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            width: 300.0,
            height: 300.0,
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: "https://eleicao-copbayer.com.br/FOTOS/$matricula.JPG",
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Matrícula: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Text("$matricula",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Data de Associação: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Text("${convertData(dataAssoc)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Data de Nascimento: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Text("${convertData(dataNasc)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              )
            ],
          ),
        ],
      ),
    ),
    actions: [
      FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("FECHAR"))
    ],
  );
}
