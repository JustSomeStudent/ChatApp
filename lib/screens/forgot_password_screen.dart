import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text ('MixChat v0.1'),
        ),
      body: Stack(
        children: [
          Container(
           // decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.only(
                //    topLeft: Radius.circular(20),
                //    topRight: Radius.circular(20))),
            child: ListView(
              children: [
                SizedBox(height: height * 0.08),
                Text(
                  'reset password'.toUpperCase(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: width * 0.8,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "EL.paštas ",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.blue),
                        ),
                      )),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Center(
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue,
                              offset: Offset(2, 2))
                        ]),
                    child: Text(
                      "Reset".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.7),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}