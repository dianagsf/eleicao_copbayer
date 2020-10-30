import 'package:copbayer_vote/controllers/data_voto_controller.dart';
import 'package:copbayer_vote/controllers/votos_controller.dart';
import 'package:copbayer_vote/models/candidatos_model.dart';
import 'package:copbayer_vote/pages/info_pages/confirm_page.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmVote extends StatefulWidget {
  final List<CandidatosModel> candidatos;
  final int matricula;

  const ConfirmVote({Key key, this.candidatos, this.matricula})
      : super(key: key);
  @override
  _ConfirmVoteState createState() => _ConfirmVoteState();
}

class _ConfirmVoteState extends State<ConfirmVote> {
  final VotosPostController _votosPostController =
      Get.put(VotosPostController());

  final DataVotoPostController _dataVotoController =
      Get.put(DataVotoPostController());

  final ScrollController controller = ScrollController();

  Future<int> statusCodeVotos;
  Future<int> statusCodeData;

  _handleCancel() {
    return Navigator.of(context).pop();
  }

  _handleConfirm() {
    widget.candidatos.forEach((element) {
      setState(() {
        statusCodeVotos = _votosPostController.postVotos({
          "data": DateTime.now().toString().substring(0, 23),
          "candidato": element.mATRICULA,
          "area": element.aREA
        });
      });
    });

    setState(() {
      statusCodeData = _dataVotoController.postDataVoto({
        "data": DateTime.now().toString().substring(0, 23),
        "matricula": widget.matricula
      });
    });

    if (statusCodeVotos != null && statusCodeData != null) {
      print("VOTO COMPUTADO!!!");
      Get.offAll(ConfirmPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirme o seu voto"),
        backgroundColor: Colors.blue[600],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return ListView.builder(
              itemCount: widget.candidatos.length + 1,
              itemBuilder: (BuildContext context, int index) {
                final buttonVote = (index == widget.candidatos.length)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildButton("VOLTAR", Colors.red, _handleCancel),
                          _buildButton(
                              "CONFIRMAR", Colors.green[300], _handleConfirm),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.all(8.0),
                        child: _buildCardCandidato(widget.candidatos, index));
                return buttonVote;
              });
        } else {
          return DraggableScrollbar.arrows(
            alwaysVisibleScrollThumb: true,
            backgroundColor: Colors.blue[600],
            controller: controller,
            child: ListView.builder(
                controller: controller,
                itemCount: widget.candidatos.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  final buttonVote = (index == widget.candidatos.length)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildButton("VOLTAR", Colors.red, _handleCancel),
                            _buildButton(
                                "CONFIRMA", Colors.green[300], _handleConfirm),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.all(8.0),
                          child: _buildCardCandidato(widget.candidatos, index));
                  return buttonVote;
                }),
          );
        }
      }),
    );
  }
}

Widget _buildCardCandidato(
  List<CandidatosModel> candidatos,
  int index,
) {
  final item = candidatos[index];
  return SizedBox(
    height: 120.0,
    child: Card(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 20.0),
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://eleicao-copbayer.com.br/FOTOS/${item.mATRICULA}.JPG"),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nOME,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Matrícula: ${item.mATRICULA.toString()}",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ])
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildButton(String text, Color color, Function function) {
  return Container(
    padding: EdgeInsets.only(top: 80.0, bottom: 30.0),
    child: SizedBox(
      height: 40.0,
      width: 140.0,
      child: RaisedButton(
        onPressed: () {
          function();
        },
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: color)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500),
        )),
      ),
    ),
  );
}
