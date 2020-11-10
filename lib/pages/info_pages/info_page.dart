import 'package:copbayer_vote/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  static const color = Color(0xff5D5BDE);
  final String image;
  final String text;
  final bool antes;

  const InfoPage({Key key, this.image, this.text, this.antes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.blue[600],
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 350.0,
                height: 350.0,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  text,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: RaisedButton(
                    onPressed: () {
                      Get.offAll(LoginPage());
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "SAIR",
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.blue[600],
                            size: 30.0,
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
