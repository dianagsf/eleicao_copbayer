import 'package:cached_network_image/cached_network_image.dart';
import 'package:copbayer_vote/controllers/candidatos_controller.dart';
import 'package:copbayer_vote/models/candidatos_model.dart';
import 'package:copbayer_vote/pages/confirm_vote_page.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HomePage extends StatefulWidget {
  final String area;
  final int matricula;

  const HomePage({Key key, this.area, this.matricula}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CandidatosController candidatosController =
      Get.put(CandidatosController());

  List<CandidatosModel> _votos = [];

  bool voted = false;

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 1920,
      width: 1080,
      allowFontScaling: true,
      child: Scaffold(
        appBar: AppBar(
          title: TextResponsive(
            "Candidatos Seccional - ${widget.area}",
            style: MediaQuery.of(context).size.width < 900
                ? TextStyle(fontSize: 50.0)
                : TextStyle(fontSize: 18.0),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            return Container(
                child: GetX<CandidatosController>(
              initState: (state) {
                candidatosController.loadCandidatos(widget.area);
              },
              builder: (_) {
                return _.candidatos.length < 1
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : ListView.separated(
                        itemCount: _.candidatos.length + 1,
                        separatorBuilder: (_, __) => Divider(),
                        itemBuilder: (context, index) {
                          final buttonVote = (index == _.candidatos.length)
                              ? Container(
                                  margin:
                                      EdgeInsets.only(top: 30.0, bottom: 50.0),
                                  child: SizedBox(
                                    height: 45,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 50.0, right: 50.0),
                                      child: RaisedButton(
                                        onPressed: () {
                                          if (_votos.length == 0) {
                                            Get.dialog(AlertDialog(
                                              title: Text(
                                                  "O voto não pode estar em branco!"),
                                              content: Text(
                                                  "Você deve votar em pelo menos 1 candidato(a)."),
                                              actions: [
                                                FlatButton(
                                                  child: Text("OK"),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            ));
                                          } else {
                                            Get.to(ConfirmVote(
                                                candidatos: _votos,
                                                matricula: widget.matricula));
                                          }
                                        },
                                        color: Colors.blue[600],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: Colors.blue[600])),
                                        child: Center(
                                            child: Text(
                                          "VOTAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: ListTile(
                                    title: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                imageUrl:
                                                    "https://eleicao-copbayer.com.br/FOTOS/${_.candidatos[index].mATRICULA}.JPG"),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _.candidatos[index].nOME,
                                                style: _votos.contains(
                                                        _.candidatos[index])
                                                    ? TextStyle(
                                                        color: Colors.green)
                                                    : TextStyle(
                                                        color: Colors.black),
                                              ),
                                              Text(
                                                "Matrícula: ${_.candidatos[index].mATRICULA}",
                                                style: _votos.contains(
                                                        _.candidatos[index])
                                                    ? TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 14.0)
                                                    : TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        voted = !voted;
                                      });

                                      setState(() {
                                        if (voted) {
                                          _votos.add(_.candidatos[index]);
                                        } else {
                                          _votos.removeWhere((element) =>
                                              element == _.candidatos[index]);
                                        }
                                      });
                                    },
                                    leading: Checkbox(
                                        value: _votos
                                            .contains(_.candidatos[index]),
                                        onChanged: (value) {
                                          if (value == true) {
                                            setState(() {
                                              _votos.add(_.candidatos[index]);
                                            });
                                          } else {
                                            setState(() {
                                              _votos.removeWhere((element) =>
                                                  element ==
                                                  _.candidatos[index]);
                                            });
                                          }
                                        }),
                                  ));

                          return buttonVote;
                        });
              },
            ));
          } else {
            return Container(
                child: GetX<CandidatosController>(
              initState: (state) {
                candidatosController.loadCandidatos(widget.area);
              },
              builder: (_) {
                return _.candidatos.length < 1
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : DraggableScrollbar.arrows(
                        alwaysVisibleScrollThumb: true,
                        backgroundColor: Colors.blue[600],
                        controller: controller,
                        child: ListView.separated(
                            controller: controller,
                            itemCount: _.candidatos.length + 1,
                            separatorBuilder: (_, __) => Divider(),
                            itemBuilder: (context, index) {
                              final buttonVote = (index == _.candidatos.length)
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0, bottom: 50.0),
                                      child: SizedBox(
                                        height: 45,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 50.0, right: 50.0),
                                          child: RaisedButton(
                                            onPressed: () {
                                              if (_votos.length == 0) {
                                                Get.dialog(AlertDialog(
                                                  title: Text(
                                                      "O voto não pode estar em branco!"),
                                                  content: Text(
                                                      "Você deve votar em pelo menos 1 candidato(a)."),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  ],
                                                ));
                                              } else {
                                                Get.to(ConfirmVote(
                                                    candidatos: _votos,
                                                    matricula:
                                                        widget.matricula));
                                              }
                                            },
                                            color: Colors.blue[600],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                side: BorderSide(
                                                    color: Colors.blue[600])),
                                            child: Center(
                                                child: Text(
                                              "VOTAR",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(top: 20.0),
                                      child: ListTile(
                                        title: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    imageUrl:
                                                        "https://eleicao-copbayer.com.br/FOTOS/${_.candidatos[index].mATRICULA}.JPG"),
                                              ),
                                              SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _.candidatos[index].nOME,
                                                    style: _votos.contains(
                                                            _.candidatos[index])
                                                        ? TextStyle(
                                                            color: Colors.green)
                                                        : TextStyle(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                  Text(
                                                    "Matrícula: ${_.candidatos[index].mATRICULA}",
                                                    style: _votos.contains(
                                                            _.candidatos[index])
                                                        ? TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 14.0)
                                                        : TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14.0),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            voted = !voted;
                                          });

                                          setState(() {
                                            if (voted) {
                                              _votos.add(_.candidatos[index]);
                                            } else {
                                              _votos.removeWhere((element) =>
                                                  element ==
                                                  _.candidatos[index]);
                                            }
                                          });
                                        },
                                        leading: Checkbox(
                                            value: _votos
                                                .contains(_.candidatos[index]),
                                            onChanged: (value) {
                                              if (value == true) {
                                                setState(() {
                                                  _votos
                                                      .add(_.candidatos[index]);
                                                });
                                              } else {
                                                setState(() {
                                                  _votos.removeWhere(
                                                      (element) =>
                                                          element ==
                                                          _.candidatos[index]);
                                                });
                                              }
                                            }),
                                      ));

                              return buttonVote;
                            }),
                      );
              },
            ));
          }
        }),
      ),
    );
  }
}
