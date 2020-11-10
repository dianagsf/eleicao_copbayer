import 'package:copbayer_vote/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color color = Colors.blue[600];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MaskedTextController cpfController =
      MaskedTextController(mask: '000.000.000-00');
  MaskedTextController dataController =
      MaskedTextController(mask: '00/00/0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            return loginMobile(
                color, context, _formKey, cpfController, dataController);
          } else {
            return loginWeb(
                color, context, _formKey, cpfController, dataController);
          }
        },
      ),
    );
  }
}

Widget loginMobile(
  Color color,
  BuildContext context,
  GlobalKey<FormState> formKey,
  MaskedTextController cpfController,
  MaskedTextController dataController,
) {
  return SingleChildScrollView(
    child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: color,
        child: Stack(children: [
          Positioned(
              top: 100.0,
              left: 50.0,
              child: SizedBox(
                width: 250,
                child: Column(children: [
                  Text(
                    "Copbayer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Eleição Delegados 2020",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              )),
          Positioned(
            top: 250.0,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 32.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(90))),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: _validateCPF,
                          keyboardType: TextInputType.number,
                          controller: cpfController,
                          decoration: InputDecoration(
                              hintText: "CPF",
                              prefixIcon: Icon(Icons.account_circle)),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          validator: _validateDataNasc,
                          keyboardType: TextInputType.number,
                          controller: dataController,
                          decoration: InputDecoration(
                              hintText: "dd/mm/aaaa",
                              labelText: "Data de Nascimento",
                              prefixIcon: Icon(Icons.calendar_today)),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                Get.to(AuthPage(
                                  cpf: cpfController.text,
                                  data: dataController.text,
                                ));
                              }
                            },
                            color: color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: color)),
                            child: Center(
                                child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ],
                    ))),
          ),
        ])),
  );
}

Widget loginWeb(
  Color color,
  BuildContext context,
  GlobalKey<FormState> formKey,
  MaskedTextController cpfController,
  MaskedTextController dataController,
) {
  return Row(
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              "Login",
              style: TextStyle(color: Colors.blue[600], fontSize: 40.0),
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: _validateCPF,
                        keyboardType: TextInputType.number,
                        controller: cpfController,
                        decoration: InputDecoration(
                            hintText: "CPF",
                            prefixIcon: Icon(Icons.account_circle)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        validator: _validateDataNasc,
                        keyboardType: TextInputType.number,
                        controller: dataController,
                        decoration: InputDecoration(
                            hintText: "dd/mm/aaaa",
                            labelText: "Data de Nascimento",
                            prefixIcon: Icon(Icons.calendar_today)),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              Get.to(AuthPage(
                                cpf: cpfController.text,
                                data: dataController.text,
                              ));
                            }
                          },
                          color: color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: color)),
                          child: Center(
                              child: Text(
                            "Entrar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[600],
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Copbayer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Eleição Delegados 2020",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: Image.asset('images/beforeImage.png'))
                  ]),
            ),
          ],
        ),
      ),
    ],
  );
}

String _validateCPF(String value) {
  if (value.isEmpty) {
    return "Infome o CPF";
  }
  if (value.length != 14) {
    return "O CPF deve conter 11 dígitos";
  }

  return null;
}

String _validateDataNasc(String value) {
  var data = value.split("/");
  if (value.isEmpty) {
    return "Infome a data de nascimento";
  }
  if (int.parse(data[0]) > 31 || int.parse(data[0]) < 1) {
    return "Informe uma data válida";
  }
  if (int.parse(data[1]) > 12 || int.parse(data[1]) < 1) {
    return "Informe um mês válido";
  }
  if (data[2].length < 4) {
    return "Informe um ano de nascimento válido";
  }
  if (int.parse(data[2]) > 2020) {
    return "Você é do futuro? Informe um ano de nascimento válido";
  }

  return null;
}
